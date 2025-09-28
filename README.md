# Bash From Zero to Hero

A comprehensive bash scripting course designed for freshers to learn bash from scratch on Amazon Linux 2023.

## Course Overview

This course is structured as a hands-on learning experience with theory, practical demos, and troubleshooting guides. Each lesson builds upon the previous one, taking you from complete beginner to confident bash scripter.

## Prerequisites

- Amazon Linux 2023 EC2 instance
- SSH access to your instance
- Basic understanding of command line interface

## Course Structure

### Module 1: Getting Started
- [Lesson 1: Introduction to Bash](./module1/lesson1-intro/README.md)
- [Lesson 2: Basic Commands](./module1/lesson2-basic-commands/README.md)
- [Lesson 3: File System Navigation](./module1/lesson3-filesystem/README.md)

### Module 2: Working with Files and Text
- [Lesson 4: File Operations](./module2/lesson4-file-operations/README.md)
- [Lesson 5: Text Processing](./module2/lesson5-text-processing/README.md)
- [Lesson 6: Permissions and Ownership](./module2/lesson6-permissions/README.md)

### Module 3: Bash Scripting Basics
- [Lesson 7: Your First Script](./module3/lesson7-first-script/README.md)
- [Lesson 8: Variables and Input](./module3/lesson8-variables/README.md)
- [Lesson 9: Conditional Statements](./module3/lesson9-conditionals/README.md)

### Module 4: Advanced Scripting
- [Lesson 10: Loops](./module4/lesson10-loops/README.md)
- [Lesson 11: Functions](./module4/lesson11-functions/README.md)
- [Lesson 12: Error Handling](./module4/lesson12-error-handling/README.md)

### Module 5: Real-World Applications
- [Lesson 13: System Administration](./module5/lesson13-sysadmin/README.md)
- [Lesson 14: Log Processing](./module5/lesson14-log-processing/README.md)
- [Lesson 15: Automation Scripts](./module5/lesson15-automation/README.md)

## How to Use This Course

1. Clone this repository to your Amazon Linux 2023 instance
2. Start with Module 1, Lesson 1
3. Follow the README in each lesson directory
4. Run the demo scripts provided
5. Complete the exercises
6. Troubleshoot using the provided guides

## Quick Start

```bash
# Clone the repository
git clone https://github.com/pravinmenghani1/bash-from-zero-to-hero.git
cd bash-from-zero-to-hero

# Make all scripts executable
find . -name "*.sh" -exec chmod +x {} \;

# Start with the first lesson
cd module1/lesson1-intro
cat README.md
```

## Support

If you encounter issues:
1. Check the troubleshooting section in each lesson
2. Review the common issues in [TROUBLESHOOTING.md](./TROUBLESHOOTING.md)
3. Create an issue in this repository

## Contributing

Feel free to contribute improvements, additional examples, or corrections via pull requests.

## License

This course is open source and available under the MIT License.
