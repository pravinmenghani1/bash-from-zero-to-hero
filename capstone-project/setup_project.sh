#!/bin/bash

echo "=== Capstone Project Setup ==="
echo "Creating System Health Monitor & Log Analyzer"
echo

# Create project directory structure
echo "📁 Creating project structure..."
mkdir -p system-monitor/{config,logs,reports,modules}

echo "✅ Created directories:"
echo "   system-monitor/"
echo "   ├── config/"
echo "   ├── logs/"
echo "   ├── reports/"
echo "   └── modules/"
echo

# Create configuration file
echo "⚙️ Creating configuration file..."
cat > system-monitor/config/settings.conf << 'EOF'
# System Monitor Configuration
CPU_THRESHOLD=80
MEMORY_THRESHOLD=85
DISK_THRESHOLD=90
LOG_RETENTION_DAYS=7
ALERT_EMAIL="admin@example.com"
CHECK_INTERVAL=300
SERVICES_TO_MONITOR="sshd httpd nginx"
LOG_FILES="/var/log/messages /var/log/secure"
EOF

echo "✅ Configuration file created with default settings"
echo

# Create initial log file
echo "📝 Creating log file..."
touch system-monitor/logs/monitor.log
echo "$(date): System Monitor initialized" >> system-monitor/logs/monitor.log

echo "✅ Log file initialized"
echo

# Create sample data for testing
echo "🧪 Creating sample test data..."
mkdir -p system-monitor/test-data

# Sample log entries for testing
cat > system-monitor/test-data/sample.log << 'EOF'
2024-01-15 10:30:15 INFO: System startup completed
2024-01-15 10:31:22 ERROR: Failed to connect to database
2024-01-15 10:32:45 WARN: High memory usage detected
2024-01-15 10:33:12 INFO: User login successful
2024-01-15 10:34:56 ERROR: Disk space critical on /var
2024-01-15 10:35:33 INFO: Backup completed successfully
EOF

echo "✅ Sample test data created"
echo

# Create project checklist
cat > system-monitor/PROJECT_CHECKLIST.md << 'EOF'
# Project Implementation Checklist

## Phase 1: Setup ✅
- [x] Project structure created
- [x] Configuration file setup
- [x] Initial logging configured
- [x] Test data prepared

## Phase 2: Core System Monitor
- [ ] CPU monitoring function
- [ ] Memory monitoring function
- [ ] Disk monitoring function
- [ ] Service monitoring function
- [ ] Main monitoring script

## Phase 3: Log Analyzer
- [ ] Log parsing functions
- [ ] Error detection
- [ ] Pattern matching
- [ ] Alert generation

## Phase 4: Integration
- [ ] Interactive menu system
- [ ] Report generation
- [ ] Configuration loading
- [ ] Error handling

## Phase 5: Final Solution
- [ ] Complete integration
- [ ] Testing and validation
- [ ] Documentation
- [ ] Deployment ready
EOF

echo "✅ Project checklist created"
echo

echo "🎉 Project setup completed!"
echo
echo "Next steps:"
echo "1. cd system-monitor"
echo "2. Review config/settings.conf"
echo "3. Run: ../build_monitor.sh"
echo
echo "Project structure created in: ./system-monitor/"
ls -la system-monitor/
