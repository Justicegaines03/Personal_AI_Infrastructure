# Code Review Command

## Purpose
Automated code review with comprehensive analysis of code quality, security vulnerabilities, performance issues, and best practices compliance.

## Usage
```bash
claude code-review [file-path] [review-type] [options]
```

## Agent Assignment
**Primary Agent:** `~/.claude/agents/engineer.md`
**Supporting Agents:** 
- `~/.claude/agents/pentester.md` (for security analysis)
- `~/.claude/agents/qatester.md` (for testing recommendations)

## Workflow

### 1. Code Analysis
- Parse code structure and dependencies
- Identify patterns and architectural decisions
- Analyze complexity and maintainability metrics
- Check for coding standard compliance

### 2. Security Assessment
- Scan for common vulnerability patterns
- Check input validation and sanitization
- Review authentication and authorization logic
- Identify potential security risks

### 3. Performance Evaluation
- Analyze algorithmic complexity
- Identify performance bottlenecks
- Review database query efficiency
- Check resource utilization patterns

### 4. Quality & Best Practices
- Verify naming conventions and code style
- Check error handling and logging
- Review documentation and comments
- Assess test coverage and quality

## Review Categories

### Code Quality
- **Readability**: Clear variable names, consistent formatting
- **Maintainability**: Modular design, low coupling, high cohesion
- **Documentation**: Comprehensive comments and README files
- **Standards**: Adherence to coding conventions and style guides

### Security Analysis
- **Input Validation**: SQL injection, XSS prevention
- **Authentication**: Secure login and session management
- **Authorization**: Proper access control implementation
- **Data Protection**: Encryption and sensitive data handling

### Performance Review
- **Algorithms**: Time and space complexity analysis
- **Database**: Query optimization and indexing strategies
- **Caching**: Effective caching implementation
- **Resource Usage**: Memory leaks and resource cleanup

### Testing & Reliability
- **Test Coverage**: Unit, integration, and E2E test completeness
- **Error Handling**: Graceful error recovery and user feedback
- **Edge Cases**: Boundary condition handling
- **Reliability**: Fault tolerance and resilience patterns

## Review Output

### Summary Report
- Overall code quality score
- Critical issues requiring immediate attention
- Recommendations for improvement
- Compliance checklist status

### Detailed Findings
- Line-by-line code annotations
- Security vulnerability assessment
- Performance optimization suggestions
- Best practice recommendations

### Action Items
- Prioritized list of improvements
- Suggested refactoring opportunities
- Testing recommendations
- Documentation updates needed

## Required Context Files
- `~/.claude/context/development/CLAUDE.md` - Development standards
- `~/.claude/context/testing/testing-guidelines.md` - Testing requirements
- `~/.claude/context/architecture/principles.md` - Architecture guidelines

## Quality Gates
- Security vulnerabilities: Zero high/critical issues
- Code coverage: Minimum 80% for new code
- Performance: No regressions in key metrics
- Documentation: All public APIs documented

## Integration Options
- Git hooks for automated review triggers
- CI/CD pipeline integration
- IDE plugin for real-time feedback
- Pull request automation and reporting