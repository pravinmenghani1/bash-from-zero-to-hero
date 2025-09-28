# Capstone Project: System Health Monitor & Log Analyzer

## Project Overview

Build a comprehensive system monitoring and log analysis tool that demonstrates all bash concepts learned throughout the course. This project will create a real-world application that system administrators would actually use.

## What You'll Build

A complete system health monitoring suite with:
- System resource monitoring
- Log file analysis and alerting
- Automated report generation
- Configuration management
- Error handling and logging
- Interactive menu system

## Skills Applied

✅ **Module 1**: File system navigation, basic commands  
✅ **Module 2**: File operations, text processing, permissions  
✅ **Module 3**: Variables, user input, conditionals  
✅ **Module 4**: Loops, functions, error handling  
✅ **Module 5**: System administration, log processing, automation  

## Project Structure

```
system-monitor/
├── monitor.sh          # Main script
├── config/
│   └── settings.conf   # Configuration file
├── logs/
│   └── monitor.log     # Application logs
├── reports/
│   └── daily_report.txt # Generated reports
└── modules/
    ├── system_check.sh  # System monitoring functions
    ├── log_analyzer.sh  # Log analysis functions
    └── alerts.sh        # Alert functions
```

## Step-by-Step Implementation

### Phase 1: Project Setup
```bash
./setup_project.sh
```

### Phase 2: Core System Monitor
```bash
./build_monitor.sh
```

### Phase 3: Log Analyzer
```bash
./build_analyzer.sh
```

### Phase 4: Integration & Testing
```bash
./integrate_project.sh
```

### Phase 5: Final Solution
```bash
./complete_solution.sh
```

## Getting Started

1. **Setup**: Run the setup script to create project structure
2. **Build**: Follow each phase to build components step by step
3. **Test**: Test each component as you build it
4. **Deploy**: Use the final integrated solution

## Project Requirements

Your system monitor should:
- Check CPU, memory, and disk usage
- Monitor system services
- Analyze log files for errors
- Generate daily reports
- Send alerts when thresholds are exceeded
- Provide an interactive menu
- Handle errors gracefully
- Log all activities

## Success Criteria

- [ ] All system metrics are monitored
- [ ] Log analysis identifies critical issues
- [ ] Reports are generated automatically
- [ ] Interactive menu works properly
- [ ] Error handling prevents crashes
- [ ] Configuration is externalized
- [ ] Code is well-documented

## Time Estimate

- **Phase 1**: 30 minutes (Setup)
- **Phase 2**: 45 minutes (Core Monitor)
- **Phase 3**: 45 minutes (Log Analyzer)
- **Phase 4**: 30 minutes (Integration)
- **Phase 5**: 15 minutes (Final Solution)

**Total**: ~3 hours

## Next Steps

Start with Phase 1: `./setup_project.sh`
