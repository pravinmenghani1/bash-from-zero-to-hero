#!/bin/bash

echo "=== Phase 3: Building Log Analyzer ==="
echo

if [ ! -d "system-monitor" ]; then
    echo "❌ Error: Run setup_project.sh first!"
    exit 1
fi

cd system-monitor

echo "🔍 Creating log analysis functions..."

# Create log analyzer module
cat > modules/log_analyzer.sh << 'EOF'
#!/bin/bash

# Load configuration
source config/settings.conf

# Function to analyze log files for errors
analyze_logs() {
    local log_file="$1"
    local time_range="${2:-24}"  # Default: last 24 hours
    
    if [ ! -f "$log_file" ]; then
        echo "⚠️  Log file not found: $log_file"
        return 1
    fi
    
    echo "📊 Analyzing: $log_file (last ${time_range} hours)"
    
    # Get date threshold
    local threshold_date=$(date -d "${time_range} hours ago" '+%Y-%m-%d %H:%M:%S' 2>/dev/null || date -v-${time_range}H '+%Y-%m-%d %H:%M:%S' 2>/dev/null)
    
    # Count different log levels
    local errors=$(grep -i "error" "$log_file" | wc -l)
    local warnings=$(grep -i "warn" "$log_file" | wc -l)
    local critical=$(grep -i "critical\|fatal" "$log_file" | wc -l)
    
    echo "   Errors: $errors"
    echo "   Warnings: $warnings"
    echo "   Critical: $critical"
    
    # Show recent critical issues
    if [ $critical -gt 0 ]; then
        echo "   🚨 Recent critical issues:"
        grep -i "critical\|fatal" "$log_file" | tail -3 | sed 's/^/      /'
    fi
    
    # Show recent errors
    if [ $errors -gt 0 ]; then
        echo "   ❌ Recent errors:"
        grep -i "error" "$log_file" | tail -3 | sed 's/^/      /'
    fi
    
    return 0
}

# Function to detect suspicious patterns
detect_patterns() {
    local log_file="$1"
    
    if [ ! -f "$log_file" ]; then
        return 1
    fi
    
    echo "🔍 Detecting suspicious patterns in: $log_file"
    
    # Failed login attempts
    local failed_logins=$(grep -i "failed\|invalid.*user\|authentication failure" "$log_file" | wc -l)
    if [ $failed_logins -gt 10 ]; then
        echo "   🚨 High number of failed login attempts: $failed_logins"
    fi
    
    # Connection refused
    local conn_refused=$(grep -i "connection refused\|connection reset" "$log_file" | wc -l)
    if [ $conn_refused -gt 5 ]; then
        echo "   ⚠️  Multiple connection issues: $conn_refused"
    fi
    
    # Disk space issues
    local disk_issues=$(grep -i "no space left\|disk.*full" "$log_file" | wc -l)
    if [ $disk_issues -gt 0 ]; then
        echo "   💾 Disk space issues detected: $disk_issues"
    fi
    
    # Memory issues
    local memory_issues=$(grep -i "out of memory\|oom\|memory.*exhausted" "$log_file" | wc -l)
    if [ $memory_issues -gt 0 ]; then
        echo "   🧠 Memory issues detected: $memory_issues"
    fi
}

# Function to generate log summary
generate_log_summary() {
    local output_file="reports/log_summary_$(date +%Y%m%d).txt"
    
    echo "📋 Generating log summary..."
    
    cat > "$output_file" << EOF
=== Log Analysis Summary ===
Generated: $(date)
Analysis Period: Last 24 hours

EOF
    
    # Analyze each configured log file
    for log_file in $LOG_FILES; do
        if [ -f "$log_file" ]; then
            echo "=== Analysis: $log_file ===" >> "$output_file"
            analyze_logs "$log_file" 24 >> "$output_file" 2>&1
            echo >> "$output_file"
            
            echo "=== Pattern Detection: $log_file ===" >> "$output_file"
            detect_patterns "$log_file" >> "$output_file" 2>&1
            echo >> "$output_file"
        else
            # Use test data if real logs not available
            if [ -f "test-data/sample.log" ]; then
                echo "=== Analysis: test-data/sample.log (demo) ===" >> "$output_file"
                analyze_logs "test-data/sample.log" 24 >> "$output_file" 2>&1
                echo >> "$output_file"
            fi
        fi
    done
    
    echo "✅ Log summary saved to: $output_file"
    return 0
}

# Function to monitor logs in real-time
monitor_logs_realtime() {
    local log_file="$1"
    
    if [ ! -f "$log_file" ]; then
        echo "⚠️  Log file not found: $log_file"
        return 1
    fi
    
    echo "👀 Monitoring $log_file in real-time (Ctrl+C to stop)..."
    echo "Looking for: ERROR, WARN, CRITICAL, FATAL"
    echo
    
    tail -f "$log_file" | while read line; do
        if echo "$line" | grep -qi "error\|warn\|critical\|fatal"; then
            echo "$(date '+%H:%M:%S') 🚨 $line"
        fi
    done
}

# Function to clean old logs
cleanup_old_logs() {
    echo "🧹 Cleaning up old log files..."
    
    # Clean application logs older than retention period
    find logs/ -name "*.log" -type f -mtime +$LOG_RETENTION_DAYS -delete 2>/dev/null
    
    # Clean old reports
    find reports/ -name "*.txt" -type f -mtime +$LOG_RETENTION_DAYS -delete 2>/dev/null
    
    echo "✅ Cleanup completed"
}
EOF

echo "✅ Log analyzer module created"

# Create alerts module
cat > modules/alerts.sh << 'EOF'
#!/bin/bash

# Load configuration
source config/settings.conf

# Function to send alert (placeholder - would integrate with email/SMS)
send_alert() {
    local severity="$1"
    local message="$2"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    
    # Log the alert
    echo "$timestamp [$severity] ALERT: $message" >> logs/alerts.log
    
    # Display alert
    case $severity in
        "CRITICAL")
            echo "🚨 CRITICAL ALERT: $message"
            ;;
        "WARNING")
            echo "⚠️  WARNING ALERT: $message"
            ;;
        "INFO")
            echo "ℹ️  INFO ALERT: $message"
            ;;
    esac
    
    # In a real implementation, this would send email/SMS
    echo "   Alert would be sent to: $ALERT_EMAIL"
}

# Function to check alert conditions
check_alert_conditions() {
    local cpu_usage="$1"
    local mem_usage="$2"
    local disk_usage="$3"
    local failed_services="$4"
    
    # CPU alerts
    if [ "$cpu_usage" -gt "$CPU_THRESHOLD" ]; then
        send_alert "WARNING" "CPU usage is ${cpu_usage}% (threshold: ${CPU_THRESHOLD}%)"
    fi
    
    # Memory alerts
    if [ "$mem_usage" -gt "$MEMORY_THRESHOLD" ]; then
        send_alert "WARNING" "Memory usage is ${mem_usage}% (threshold: ${MEMORY_THRESHOLD}%)"
    fi
    
    # Disk alerts
    if [ "$disk_usage" -gt "$DISK_THRESHOLD" ]; then
        send_alert "CRITICAL" "Disk usage is ${disk_usage}% (threshold: ${DISK_THRESHOLD}%)"
    fi
    
    # Service alerts
    if [ -n "$failed_services" ]; then
        send_alert "CRITICAL" "Services down: $failed_services"
    fi
}
EOF

echo "✅ Alerts module created"

# Update main monitor script to include log analysis
cat >> monitor.sh << 'EOF'

# Load additional modules
source "$SCRIPT_DIR/modules/log_analyzer.sh"
source "$SCRIPT_DIR/modules/alerts.sh"

# Function to run log analysis
run_log_analysis() {
    log_message "INFO" "Starting log analysis"
    
    echo "=== Log Analysis ==="
    echo "Timestamp: $(date)"
    echo
    
    # Analyze configured log files
    for log_file in $LOG_FILES; do
        if [ -f "$log_file" ]; then
            analyze_logs "$log_file"
            detect_patterns "$log_file"
            echo
        fi
    done
    
    # If no real logs, use test data
    if [ -f "test-data/sample.log" ]; then
        echo "=== Demo Analysis (test-data/sample.log) ==="
        analyze_logs "test-data/sample.log"
        detect_patterns "test-data/sample.log"
        echo
    fi
    
    log_message "INFO" "Log analysis completed"
}

# Function to generate comprehensive report
generate_report() {
    local report_file="reports/system_report_$(date +%Y%m%d_%H%M%S).txt"
    
    echo "📊 Generating comprehensive report..."
    
    {
        echo "=== System Health & Log Analysis Report ==="
        echo "Generated: $(date)"
        echo "Hostname: $(hostname)"
        echo
        
        echo "=== System Health Check ==="
        run_system_check
        echo
        
        echo "=== Log Analysis ==="
        run_log_analysis
        
    } > "$report_file"
    
    echo "✅ Report saved to: $report_file"
    echo "📄 Report preview:"
    echo "----------------------------------------"
    head -20 "$report_file"
    echo "----------------------------------------"
}
EOF

echo "✅ Enhanced main script with log analysis"
echo

echo "🧪 Testing log analyzer..."
echo
./monitor.sh --check

echo
echo "🎉 Phase 3 completed!"
echo
echo "Available features:"
echo "- System monitoring"
echo "- Log analysis"
echo "- Alert generation"
echo
echo "Next steps:"
echo "1. Test log analysis features"
echo "2. Run: ../integrate_project.sh"
