#!/bin/bash

echo "=== Phase 4: Integration & Advanced Features ==="
echo

if [ ! -d "system-monitor" ]; then
    echo "❌ Error: Run previous phases first!"
    exit 1
fi

cd system-monitor

echo "🔗 Integrating all components..."

# Create enhanced main script with full menu system
cat > monitor.sh << 'EOF'
#!/bin/bash

# Enhanced System Monitor with Full Integration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_FILE="$SCRIPT_DIR/logs/monitor.log"
CONFIG_FILE="$SCRIPT_DIR/config/settings.conf"

# Load configuration
if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    echo "❌ Configuration file not found: $CONFIG_FILE"
    exit 1
fi

# Load all modules
source "$SCRIPT_DIR/modules/system_check.sh"
source "$SCRIPT_DIR/modules/log_analyzer.sh"
source "$SCRIPT_DIR/modules/alerts.sh"

# Enhanced logging function
log_message() {
    local level="$1"
    local message="$2"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "$timestamp [$level] $message" >> "$LOG_FILE"
    
    # Also display with colors if terminal supports it
    case $level in
        "ERROR")
            echo -e "\033[31m$timestamp [$level] $message\033[0m"
            ;;
        "WARN")
            echo -e "\033[33m$timestamp [$level] $message\033[0m"
            ;;
        "INFO")
            echo -e "\033[32m$timestamp [$level] $message\033[0m"
            ;;
        *)
            echo "$timestamp [$level] $message"
            ;;
    esac
}

# Enhanced system check with alerting
run_system_check() {
    log_message "INFO" "Starting comprehensive system health check"
    
    local alerts=0
    local cpu_usage=0
    local mem_usage=0
    local disk_usage=0
    local failed_services=""
    
    echo "=== Comprehensive System Health Check ==="
    echo "Timestamp: $(date)"
    echo "Hostname: $(hostname)"
    echo "User: $(whoami)"
    echo
    
    # CPU Check
    echo "🖥️  CPU Status:"
    if ! check_cpu; then
        ((alerts++))
        cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
        cpu_usage=${cpu_usage%.*}
    fi
    echo
    
    # Memory Check
    echo "🧠 Memory Status:"
    if ! check_memory; then
        ((alerts++))
        local mem_info=$(free | grep Mem)
        local total=$(echo $mem_info | awk '{print $2}')
        local used=$(echo $mem_info | awk '{print $3}')
        mem_usage=$((used * 100 / total))
    fi
    echo
    
    # Disk Check
    echo "💾 Disk Status:"
    if ! check_disk; then
        ((alerts++))
        disk_usage=$(df / | tail -1 | awk '{print $5}' | cut -d'%' -f1)
    fi
    echo
    
    # Service Check
    echo "⚙️  Service Status:"
    if ! check_services; then
        ((alerts++))
        # Collect failed services for alerting
        for service in $SERVICES_TO_MONITOR; do
            if command -v systemctl >/dev/null 2>&1; then
                if ! systemctl is-active --quiet "$service" 2>/dev/null; then
                    failed_services="$failed_services $service"
                fi
            fi
        done
    fi
    echo
    
    # System Information
    echo "📊 System Information:"
    get_uptime
    get_load_average
    echo "Processes: $(ps aux | wc -l)"
    echo "Logged in users: $(who | wc -l)"
    echo
    
    # Generate alerts if needed
    if [ $alerts -gt 0 ]; then
        check_alert_conditions "$cpu_usage" "$mem_usage" "$disk_usage" "$failed_services"
    fi
    
    # Summary
    if [ $alerts -eq 0 ]; then
        echo "✅ All systems operating normally"
        log_message "INFO" "System check completed - all systems normal"
    else
        echo "⚠️  $alerts issue(s) detected - check alerts"
        log_message "WARN" "System check completed - $alerts issues detected"
    fi
    
    return $alerts
}

# Enhanced log analysis
run_log_analysis() {
    log_message "INFO" "Starting comprehensive log analysis"
    
    echo "=== Comprehensive Log Analysis ==="
    echo "Timestamp: $(date)"
    echo
    
    # Analyze system logs
    echo "📋 System Log Analysis:"
    for log_file in $LOG_FILES; do
        if [ -f "$log_file" ]; then
            analyze_logs "$log_file"
            detect_patterns "$log_file"
            echo
        fi
    done
    
    # Analyze application logs
    echo "📋 Application Log Analysis:"
    if [ -f "logs/monitor.log" ]; then
        analyze_logs "logs/monitor.log"
        echo
    fi
    
    # Use demo data if real logs not available
    if [ -f "test-data/sample.log" ]; then
        echo "📋 Demo Log Analysis:"
        analyze_logs "test-data/sample.log"
        detect_patterns "test-data/sample.log"
        echo
    fi
    
    log_message "INFO" "Log analysis completed"
}

# Generate comprehensive report
generate_comprehensive_report() {
    local report_file="reports/comprehensive_report_$(date +%Y%m%d_%H%M%S).txt"
    
    echo "📊 Generating comprehensive system report..."
    
    {
        echo "=========================================="
        echo "    SYSTEM HEALTH & SECURITY REPORT"
        echo "=========================================="
        echo "Generated: $(date)"
        echo "Hostname: $(hostname)"
        echo "Report ID: $(date +%Y%m%d_%H%M%S)"
        echo
        
        echo "=========================================="
        echo "           SYSTEM HEALTH CHECK"
        echo "=========================================="
        run_system_check
        echo
        
        echo "=========================================="
        echo "            LOG ANALYSIS"
        echo "=========================================="
        run_log_analysis
        
        echo "=========================================="
        echo "         CONFIGURATION SUMMARY"
        echo "=========================================="
        echo "Monitoring Thresholds:"
        echo "  CPU: ${CPU_THRESHOLD}%"
        echo "  Memory: ${MEMORY_THRESHOLD}%"
        echo "  Disk: ${DISK_THRESHOLD}%"
        echo "  Check Interval: ${CHECK_INTERVAL}s"
        echo "  Log Retention: ${LOG_RETENTION_DAYS} days"
        echo
        
        echo "=========================================="
        echo "              RECOMMENDATIONS"
        echo "=========================================="
        echo "1. Review any alerts generated above"
        echo "2. Monitor trending resource usage"
        echo "3. Ensure regular log rotation"
        echo "4. Update monitoring thresholds as needed"
        echo "5. Schedule regular system maintenance"
        echo
        
        echo "=========================================="
        echo "               END OF REPORT"
        echo "=========================================="
        
    } > "$report_file"
    
    echo "✅ Comprehensive report saved to: $report_file"
    echo
    echo "📄 Report Summary:"
    echo "----------------------------------------"
    head -30 "$report_file"
    echo "... (full report in file)"
    echo "----------------------------------------"
    
    return 0
}

# Enhanced interactive menu
show_enhanced_menu() {
    clear
    echo "=========================================="
    echo "      SYSTEM HEALTH MONITOR v2.0"
    echo "=========================================="
    echo "Hostname: $(hostname)"
    echo "Current Time: $(date)"
    echo "User: $(whoami)"
    echo "=========================================="
    echo
    echo "📊 MONITORING OPTIONS:"
    echo "  1. Run System Health Check"
    echo "  2. Run Log Analysis"
    echo "  3. Generate Comprehensive Report"
    echo "  4. Monitor Logs Real-time"
    echo
    echo "📋 INFORMATION:"
    echo "  5. View Recent Activity Logs"
    echo "  6. View Recent Alerts"
    echo "  7. Show Configuration"
    echo "  8. System Information"
    echo
    echo "🔧 MAINTENANCE:"
    echo "  9. Clean Old Logs"
    echo " 10. Test Alert System"
    echo
    echo "❌ EXIT:"
    echo " 11. Exit"
    echo
    echo "=========================================="
}

# Main execution logic
case "$1" in
    "--check")
        run_system_check
        ;;
    "--logs")
        run_log_analysis
        ;;
    "--report")
        generate_comprehensive_report
        ;;
    "--monitor")
        if [ -n "$2" ]; then
            monitor_logs_realtime "$2"
        else
            echo "Usage: $0 --monitor <log_file>"
        fi
        ;;
    "--menu"|"")
        while true; do
            show_enhanced_menu
            read -p "Select option (1-11): " choice
            echo
            
            case $choice in
                1)
                    run_system_check
                    ;;
                2)
                    run_log_analysis
                    ;;
                3)
                    generate_comprehensive_report
                    ;;
                4)
                    echo "Available log files:"
                    echo "- logs/monitor.log (application logs)"
                    echo "- test-data/sample.log (demo data)"
                    read -p "Enter log file path: " log_path
                    if [ -f "$log_path" ]; then
                        monitor_logs_realtime "$log_path"
                    else
                        echo "❌ File not found: $log_path"
                    fi
                    ;;
                5)
                    echo "=== Recent Activity Logs ==="
                    tail -30 "$LOG_FILE"
                    ;;
                6)
                    echo "=== Recent Alerts ==="
                    if [ -f "logs/alerts.log" ]; then
                        tail -20 "logs/alerts.log"
                    else
                        echo "No alerts found"
                    fi
                    ;;
                7)
                    echo "=== Current Configuration ==="
                    cat "$CONFIG_FILE"
                    ;;
                8)
                    echo "=== System Information ==="
                    echo "Hostname: $(hostname)"
                    echo "OS: $(uname -a)"
                    echo "Uptime: $(uptime)"
                    echo "Disk Space:"
                    df -h
                    echo "Memory:"
                    free -h
                    ;;
                9)
                    cleanup_old_logs
                    ;;
                10)
                    echo "=== Testing Alert System ==="
                    send_alert "INFO" "Test alert - system is functioning"
                    send_alert "WARNING" "Test warning alert"
                    send_alert "CRITICAL" "Test critical alert"
                    ;;
                11)
                    echo "Thank you for using System Health Monitor!"
                    echo "Stay vigilant! 🛡️"
                    exit 0
                    ;;
                *)
                    echo "❌ Invalid option. Please select 1-11."
                    ;;
            esac
            
            echo
            read -p "Press Enter to continue..." -t 30
        done
        ;;
    *)
        echo "System Health Monitor v2.0"
        echo
        echo "Usage: $0 [option]"
        echo
        echo "Options:"
        echo "  --check     Run system health check"
        echo "  --logs      Run log analysis"
        echo "  --report    Generate comprehensive report"
        echo "  --monitor   Monitor log file in real-time"
        echo "  --menu      Interactive menu (default)"
        echo
        echo "Examples:"
        echo "  $0                    # Interactive menu"
        echo "  $0 --check          # Quick system check"
        echo "  $0 --report         # Generate full report"
        echo "  $0 --monitor /var/log/messages"
        ;;
esac
EOF

chmod +x monitor.sh

echo "✅ Enhanced main script created"

# Create automated scheduler script
cat > schedule_monitoring.sh << 'EOF'
#!/bin/bash

# Automated Monitoring Scheduler
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== Automated Monitoring Scheduler ==="
echo "This script sets up automated monitoring"
echo

# Create cron job for regular monitoring
create_cron_job() {
    local cron_file="/tmp/monitor_cron"
    
    echo "Setting up automated monitoring..."
    
    # Create cron entries
    cat > "$cron_file" << EOF
# System Health Monitor - Automated Jobs
# Run system check every 5 minutes
*/5 * * * * $SCRIPT_DIR/monitor.sh --check >> $SCRIPT_DIR/logs/automated.log 2>&1

# Generate daily report at 6 AM
0 6 * * * $SCRIPT_DIR/monitor.sh --report >> $SCRIPT_DIR/logs/automated.log 2>&1

# Clean old logs weekly (Sunday at 2 AM)
0 2 * * 0 find $SCRIPT_DIR/logs/ -name "*.log" -mtime +7 -delete
EOF
    
    echo "Cron jobs created in: $cron_file"
    echo "To install, run: crontab $cron_file"
    echo
    echo "Cron job contents:"
    cat "$cron_file"
}

# Create systemd service (for systems that support it)
create_systemd_service() {
    cat > monitor.service << 'EOF'
[Unit]
Description=System Health Monitor
After=network.target

[Service]
Type=simple
ExecStart=/path/to/system-monitor/monitor.sh --check
Restart=always
RestartSec=300
User=root

[Install]
WantedBy=multi-user.target
EOF
    
    echo "Systemd service file created: monitor.service"
    echo "To install:"
    echo "1. sudo cp monitor.service /etc/systemd/system/"
    echo "2. sudo systemctl enable monitor.service"
    echo "3. sudo systemctl start monitor.service"
}

echo "Choose automation method:"
echo "1. Cron jobs (traditional)"
echo "2. Systemd service (modern)"
echo "3. Both"
echo "4. Skip automation"

read -p "Select option (1-4): " choice

case $choice in
    1)
        create_cron_job
        ;;
    2)
        create_systemd_service
        ;;
    3)
        create_cron_job
        create_systemd_service
        ;;
    4)
        echo "Skipping automation setup"
        ;;
    *)
        echo "Invalid choice"
        ;;
esac
EOF

chmod +x schedule_monitoring.sh

echo "✅ Automation scheduler created"
echo

echo "🧪 Testing integrated system..."
echo
./monitor.sh --check

echo
echo "🎉 Phase 4 completed!"
echo
echo "✅ Full integration complete with:"
echo "- Enhanced interactive menu"
echo "- Comprehensive reporting"
echo "- Real-time log monitoring"
echo "- Alert system"
echo "- Automation options"
echo
echo "Next steps:"
echo "1. Test full menu: ./monitor.sh --menu"
echo "2. Run: ../complete_solution.sh"
