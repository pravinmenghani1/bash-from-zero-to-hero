#!/bin/bash

echo "=== Phase 2: Building Core System Monitor ==="
echo

if [ ! -d "system-monitor" ]; then
    echo "❌ Error: Run setup_project.sh first!"
    exit 1
fi

cd system-monitor

echo "🔧 Creating system monitoring functions..."

# Create system check module
cat > modules/system_check.sh << 'EOF'
#!/bin/bash

# Load configuration
source config/settings.conf

# Function to check CPU usage
check_cpu() {
    local cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
    cpu_usage=${cpu_usage%.*}  # Remove decimal part
    
    echo "CPU Usage: ${cpu_usage}%"
    
    if [ "$cpu_usage" -gt "$CPU_THRESHOLD" ]; then
        echo "⚠️  WARNING: CPU usage (${cpu_usage}%) exceeds threshold (${CPU_THRESHOLD}%)"
        return 1
    fi
    return 0
}

# Function to check memory usage
check_memory() {
    local mem_info=$(free | grep Mem)
    local total=$(echo $mem_info | awk '{print $2}')
    local used=$(echo $mem_info | awk '{print $3}')
    local mem_usage=$((used * 100 / total))
    
    echo "Memory Usage: ${mem_usage}%"
    
    if [ "$mem_usage" -gt "$MEMORY_THRESHOLD" ]; then
        echo "⚠️  WARNING: Memory usage (${mem_usage}%) exceeds threshold (${MEMORY_THRESHOLD}%)"
        return 1
    fi
    return 0
}

# Function to check disk usage
check_disk() {
    local disk_usage=$(df / | tail -1 | awk '{print $5}' | cut -d'%' -f1)
    
    echo "Disk Usage: ${disk_usage}%"
    
    if [ "$disk_usage" -gt "$DISK_THRESHOLD" ]; then
        echo "⚠️  WARNING: Disk usage (${disk_usage}%) exceeds threshold (${DISK_THRESHOLD}%)"
        return 1
    fi
    return 0
}

# Function to check system services
check_services() {
    echo "Checking system services..."
    local failed_services=()
    
    for service in $SERVICES_TO_MONITOR; do
        if command -v systemctl >/dev/null 2>&1; then
            if ! systemctl is-active --quiet "$service" 2>/dev/null; then
                failed_services+=("$service")
                echo "❌ Service $service is not running"
            else
                echo "✅ Service $service is running"
            fi
        else
            # Fallback for systems without systemctl
            if ! pgrep "$service" >/dev/null; then
                failed_services+=("$service")
                echo "❌ Process $service not found"
            else
                echo "✅ Process $service is running"
            fi
        fi
    done
    
    if [ ${#failed_services[@]} -gt 0 ]; then
        echo "⚠️  WARNING: Failed services: ${failed_services[*]}"
        return 1
    fi
    return 0
}

# Function to get system uptime
get_uptime() {
    echo "System Uptime: $(uptime -p 2>/dev/null || uptime)"
}

# Function to get load average
get_load_average() {
    echo "Load Average: $(uptime | awk -F'load average:' '{print $2}')"
}
EOF

echo "✅ System check module created"

# Create main monitor script
cat > monitor.sh << 'EOF'
#!/bin/bash

# Main System Monitor Script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_FILE="$SCRIPT_DIR/logs/monitor.log"

# Load modules
source "$SCRIPT_DIR/modules/system_check.sh"

# Logging function
log_message() {
    local level="$1"
    local message="$2"
    echo "$(date '+%Y-%m-%d %H:%M:%S') [$level] $message" >> "$LOG_FILE"
    echo "$(date '+%Y-%m-%d %H:%M:%S') [$level] $message"
}

# Main monitoring function
run_system_check() {
    log_message "INFO" "Starting system health check"
    
    local alerts=0
    
    echo "=== System Health Check ==="
    echo "Timestamp: $(date)"
    echo
    
    # Check CPU
    if ! check_cpu; then
        ((alerts++))
        log_message "WARN" "CPU threshold exceeded"
    fi
    echo
    
    # Check Memory
    if ! check_memory; then
        ((alerts++))
        log_message "WARN" "Memory threshold exceeded"
    fi
    echo
    
    # Check Disk
    if ! check_disk; then
        ((alerts++))
        log_message "WARN" "Disk threshold exceeded"
    fi
    echo
    
    # Check Services
    if ! check_services; then
        ((alerts++))
        log_message "WARN" "Service check failed"
    fi
    echo
    
    # System Info
    get_uptime
    get_load_average
    echo
    
    # Summary
    if [ $alerts -eq 0 ]; then
        echo "✅ All systems normal"
        log_message "INFO" "System check completed - all normal"
    else
        echo "⚠️  $alerts alert(s) detected"
        log_message "WARN" "System check completed - $alerts alerts"
    fi
    
    return $alerts
}

# Interactive menu
show_menu() {
    echo "=== System Monitor Menu ==="
    echo "1. Run system check"
    echo "2. View recent logs"
    echo "3. Show configuration"
    echo "4. Generate report"
    echo "5. Exit"
    echo
}

# Main execution
if [ "$1" = "--check" ]; then
    run_system_check
elif [ "$1" = "--menu" ]; then
    while true; do
        show_menu
        read -p "Select option (1-5): " choice
        
        case $choice in
            1)
                run_system_check
                echo
                ;;
            2)
                echo "=== Recent Logs ==="
                tail -20 "$LOG_FILE"
                echo
                ;;
            3)
                echo "=== Configuration ==="
                cat config/settings.conf
                echo
                ;;
            4)
                echo "Report generation will be implemented in Phase 4"
                echo
                ;;
            5)
                echo "Goodbye!"
                exit 0
                ;;
            *)
                echo "Invalid option. Please try again."
                ;;
        esac
        
        read -p "Press Enter to continue..."
        clear
    done
else
    echo "Usage: $0 [--check|--menu]"
    echo "  --check  Run system check once"
    echo "  --menu   Interactive menu"
fi
EOF

chmod +x monitor.sh modules/system_check.sh

echo "✅ Main monitor script created"
echo

echo "🧪 Testing the system monitor..."
echo
./monitor.sh --check

echo
echo "🎉 Phase 2 completed!"
echo
echo "Next steps:"
echo "1. Test interactive menu: ./monitor.sh --menu"
echo "2. Run: ../build_analyzer.sh"
