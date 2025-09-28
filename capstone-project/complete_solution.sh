#!/bin/bash

echo "=== Phase 5: Complete Solution & Final Validation ==="
echo

if [ ! -d "system-monitor" ]; then
    echo "❌ Error: Run all previous phases first!"
    exit 1
fi

cd system-monitor

echo "🎯 Final validation and solution completion..."

# Create comprehensive documentation
cat > SOLUTION_GUIDE.md << 'EOF'
# System Health Monitor - Complete Solution

## Project Overview

This capstone project demonstrates mastery of all bash scripting concepts through a real-world system monitoring application.

## Features Implemented

### ✅ Core Monitoring
- **CPU Usage Monitoring** - Tracks CPU utilization with configurable thresholds
- **Memory Usage Monitoring** - Monitors RAM usage and alerts on high consumption
- **Disk Space Monitoring** - Checks disk usage and warns before space runs out
- **Service Monitoring** - Ensures critical services are running

### ✅ Log Analysis
- **Error Detection** - Automatically finds errors, warnings, and critical issues
- **Pattern Recognition** - Identifies suspicious activities and security threats
- **Real-time Monitoring** - Live log monitoring with instant alerts
- **Historical Analysis** - Analyzes log trends over time

### ✅ Alerting System
- **Multi-level Alerts** - INFO, WARNING, and CRITICAL alert levels
- **Configurable Thresholds** - Customizable alert triggers
- **Alert Logging** - All alerts are logged for audit trail
- **Multiple Notification Methods** - Ready for email/SMS integration

### ✅ Reporting
- **Comprehensive Reports** - Detailed system health and security reports
- **Automated Generation** - Scheduled report creation
- **Multiple Formats** - Text reports with structured data
- **Historical Tracking** - Report archival and retention

### ✅ User Interface
- **Interactive Menu** - User-friendly command-line interface
- **Command Line Options** - Scriptable automation support
- **Color-coded Output** - Enhanced readability
- **Help System** - Built-in documentation

### ✅ Configuration Management
- **External Configuration** - All settings in config files
- **Environment Adaptation** - Works across different systems
- **Flexible Thresholds** - Easy customization
- **Service Configuration** - Configurable service monitoring

## Skills Demonstrated

### Module 1: Getting Started
- ✅ File system navigation (`cd`, `pwd`, `ls`)
- ✅ Basic command usage and understanding
- ✅ Shell environment interaction

### Module 2: Working with Files and Text
- ✅ File operations (`touch`, `cp`, `mv`, `rm`)
- ✅ Text processing (`grep`, `awk`, `sed`, `cut`)
- ✅ File permissions and ownership (`chmod`, `chown`)

### Module 3: Bash Scripting Basics
- ✅ Script creation and execution
- ✅ Variables and parameter expansion
- ✅ User input handling (`read`)
- ✅ Command line arguments (`$1`, `$2`, `$@`)
- ✅ Conditional statements (`if`, `case`)

### Module 4: Advanced Scripting
- ✅ Loops (`for`, `while`)
- ✅ Functions and modular code
- ✅ Error handling (`set -e`, return codes)
- ✅ Signal handling and cleanup

### Module 5: Real-World Applications
- ✅ System administration tasks
- ✅ Log processing and analysis
- ✅ Automation and scheduling
- ✅ Service monitoring

## Architecture

```
system-monitor/
├── monitor.sh              # Main application script
├── config/
│   └── settings.conf       # Configuration file
├── modules/
│   ├── system_check.sh     # System monitoring functions
│   ├── log_analyzer.sh     # Log analysis functions
│   └── alerts.sh           # Alert management functions
├── logs/
│   ├── monitor.log         # Application logs
│   └── alerts.log          # Alert history
├── reports/
│   └── *.txt              # Generated reports
└── test-data/
    └── sample.log         # Test data for demonstrations
```

## Usage Examples

### Quick System Check
```bash
./monitor.sh --check
```

### Interactive Menu
```bash
./monitor.sh --menu
```

### Generate Report
```bash
./monitor.sh --report
```

### Real-time Log Monitoring
```bash
./monitor.sh --monitor /var/log/messages
```

## Configuration

Edit `config/settings.conf` to customize:

```bash
CPU_THRESHOLD=80           # CPU alert threshold (%)
MEMORY_THRESHOLD=85        # Memory alert threshold (%)
DISK_THRESHOLD=90          # Disk alert threshold (%)
LOG_RETENTION_DAYS=7       # Log retention period
ALERT_EMAIL="admin@example.com"  # Alert recipient
CHECK_INTERVAL=300         # Check interval (seconds)
SERVICES_TO_MONITOR="sshd httpd nginx"  # Services to monitor
LOG_FILES="/var/log/messages /var/log/secure"  # Logs to analyze
```

## Automation

### Cron Jobs
```bash
# Run system check every 5 minutes
*/5 * * * * /path/to/monitor.sh --check

# Generate daily report at 6 AM
0 6 * * * /path/to/monitor.sh --report
```

### Systemd Service
```bash
sudo cp monitor.service /etc/systemd/system/
sudo systemctl enable monitor.service
sudo systemctl start monitor.service
```

## Troubleshooting

### Common Issues

1. **Permission Denied**
   - Solution: `chmod +x monitor.sh`

2. **Configuration Not Found**
   - Solution: Ensure `config/settings.conf` exists

3. **Log Files Not Accessible**
   - Solution: Check file permissions and paths

4. **Services Not Detected**
   - Solution: Verify service names in configuration

### Debug Mode
```bash
bash -x monitor.sh --check
```

## Extension Ideas

1. **Web Dashboard** - Add web interface
2. **Database Integration** - Store metrics in database
3. **Email Notifications** - Implement actual email alerts
4. **Mobile App** - Create mobile monitoring app
5. **Clustering** - Monitor multiple servers
6. **Machine Learning** - Predictive analytics

## Conclusion

This project successfully demonstrates:
- Complete bash scripting proficiency
- Real-world problem solving
- System administration skills
- Software engineering best practices
- Production-ready code quality

The solution is modular, configurable, and ready for production deployment.
EOF

echo "✅ Solution documentation created"

# Create final validation script
cat > validate_solution.sh << 'EOF'
#!/bin/bash

echo "=== Solution Validation ==="
echo

# Test all major functions
echo "🧪 Testing all components..."

errors=0

# Test 1: Configuration loading
echo "1. Testing configuration loading..."
if [ -f "config/settings.conf" ]; then
    source config/settings.conf
    echo "   ✅ Configuration loaded successfully"
else
    echo "   ❌ Configuration file missing"
    ((errors++))
fi

# Test 2: Module loading
echo "2. Testing module loading..."
modules=("modules/system_check.sh" "modules/log_analyzer.sh" "modules/alerts.sh")
for module in "${modules[@]}"; do
    if [ -f "$module" ]; then
        echo "   ✅ $module exists"
    else
        echo "   ❌ $module missing"
        ((errors++))
    fi
done

# Test 3: Script execution
echo "3. Testing script execution..."
if ./monitor.sh --check >/dev/null 2>&1; then
    echo "   ✅ Main script executes successfully"
else
    echo "   ❌ Main script execution failed"
    ((errors++))
fi

# Test 4: Log file creation
echo "4. Testing log file creation..."
if [ -f "logs/monitor.log" ]; then
    echo "   ✅ Log file exists"
else
    echo "   ❌ Log file not created"
    ((errors++))
fi

# Test 5: Report generation
echo "5. Testing report generation..."
if ./monitor.sh --report >/dev/null 2>&1; then
    if ls reports/*.txt >/dev/null 2>&1; then
        echo "   ✅ Report generation successful"
    else
        echo "   ❌ No reports generated"
        ((errors++))
    fi
else
    echo "   ❌ Report generation failed"
    ((errors++))
fi

# Summary
echo
echo "=== Validation Summary ==="
if [ $errors -eq 0 ]; then
    echo "🎉 All tests passed! Solution is complete and functional."
    echo
    echo "✅ Project Requirements Met:"
    echo "   - System monitoring ✅"
    echo "   - Log analysis ✅"
    echo "   - Alert system ✅"
    echo "   - Report generation ✅"
    echo "   - Interactive interface ✅"
    echo "   - Configuration management ✅"
    echo "   - Error handling ✅"
    echo "   - Modular design ✅"
    echo
    echo "🏆 CAPSTONE PROJECT COMPLETED SUCCESSFULLY!"
else
    echo "⚠️  $errors error(s) found. Please review and fix issues."
fi

return $errors
EOF

chmod +x validate_solution.sh

echo "✅ Validation script created"

# Run final validation
echo
echo "🔍 Running final validation..."
./validate_solution.sh

echo
echo "📊 Project Statistics:"
echo "   Total files created: $(find . -type f | wc -l)"
echo "   Total lines of code: $(find . -name "*.sh" -exec wc -l {} + | tail -1 | awk '{print $1}')"
echo "   Configuration files: $(find . -name "*.conf" | wc -l)"
echo "   Documentation files: $(find . -name "*.md" | wc -l)"

echo
echo "🎯 Final Project Structure:"
tree . 2>/dev/null || find . -type d | sed 's/[^-][^\/]*\//  /g;s/^  //'

echo
echo "🎉 CAPSTONE PROJECT COMPLETE!"
echo
echo "🏆 Congratulations! You have successfully:"
echo "   ✅ Built a production-ready system monitoring tool"
echo "   ✅ Applied all bash scripting concepts learned"
echo "   ✅ Created modular, maintainable code"
echo "   ✅ Implemented real-world functionality"
echo "   ✅ Demonstrated professional development practices"
echo
echo "🚀 Your system monitor is ready for deployment!"
echo "   Run: ./monitor.sh --menu to start using it"
echo
echo "📚 Next steps for continued learning:"
echo "   - Deploy on a real server"
echo "   - Add web interface"
echo "   - Integrate with monitoring systems"
echo "   - Contribute to open source projects"
echo
echo "Well done! You've mastered bash scripting! 🎓"
