# Fabric Framework Usage Guide

## Overview

Fabric is an open-source AI assistant framework providing 220+ specialized AI prompt patterns for problem-solving, content creation, analysis, and automation. It operates as an independent tool alongside your Claude infrastructure.

**GitHub**: https://github.com/danielmiessler/Fabric.git  
**Installation Location**: `~/.config/fabric/`  
**Command**: `fabric - U`

## Core Capabilities

### 1. Problem-Solving Patterns (220+ Available)
Specialized prompts for hundreds of use cases:
- **Analysis**: `analyze_claims`, `analyze_answers`, `analyze_debate`
- **Content**: Content creation, optimization, and enhancement
- **Technical**: Code review, security analysis, documentation
- **Business**: Strategy, marketing, competitive analysis

### 2. Web Scraping with Context
```bash
fabric -u $URL    # Scrape and analyze any webpage with jina.ai integration
```
- Extracts meaningful content from web pages
- Applies AI analysis patterns to scraped content
- Works independently from your custom commands

### 3. Pattern-Based Processing
- Apply specialized AI patterns to any text input
- Chain patterns for complex analysis workflows
- Use with files, URLs, or direct input

### 4. Content Enhancement
- Automatic content optimization using community patterns
- SEO and readability improvements
- Multi-format content adaptation

## Usage with Your Agent System

Fabric operates as an external tool that complements your Claude agents. Your agents can recommend Fabric patterns for specific use cases:

### For Engineer Tasks
**Suggested Fabric Patterns:**
- `analyze_logs` - Log file analysis and debugging
- `code_review` - Automated code quality assessment
- `analyze_incident` - Technical incident investigation

### For Marketing Tasks
**Suggested Fabric Patterns:**
- `analyze_claims` - Marketing claim verification
- `analyze_candidates` - Competitive analysis
- Content optimization patterns

### For Security Tasks
**Suggested Fabric Patterns:**
- `analyze_email_headers` - Email security analysis
- `analyze_malware` - Malware investigation
- `analyze_incident` - Security incident response

### For QA Tasks
**Suggested Fabric Patterns:**
- `analyze_mistakes` - Error pattern analysis
- Quality assessment frameworks
- Bug analysis and categorization

## Independent Usage Examples

### Content Research Workflow
```bash
# Research phase (independent of commands)
fabric -u "research-url.com" -p analyze_claims > research.md

# Then use your custom commands with the research
claude write-blog-post --research-file research.md
```

### Security Analysis Workflow
```bash
# Analyze suspicious URLs (independent)
fabric -u "suspicious-site.com" -p analyze_malware

# Process log files independently
fabric -p analyze_logs < security.log

# Then use security audit command with findings
claude security-audit --fabric-input findings.md
```

### Competitive Intelligence
```bash
# Scrape competitor content independently
fabric -u "competitor.com" -p analyze_claims

# Run competitive analysis independently
fabric -p analyze_candidates --input "competitor-list.txt"

# Then use your competitor-analysis command
claude competitor-analysis --fabric-research analysis.md
```

## Available Pattern Categories

### Analysis Patterns
- `analyze_answers` - Answer quality assessment
- `analyze_bill` - Legislative analysis
- `analyze_candidates` - Candidate evaluation
- `analyze_claims` - Fact and claim verification
- `analyze_comments` - Comment analysis
- `analyze_debate` - Debate structure analysis
- `analyze_incident` - Incident investigation
- `analyze_logs` - Log file analysis
- `analyze_malware` - Security threat analysis

### Content Creation Patterns
- Blog post generation
- Social media content
- Technical documentation
- Marketing materials
- Educational content

### Technical Patterns
- Code review and analysis
- System architecture evaluation
- Performance optimization
- Security assessment

### Business Patterns
- Strategic planning
- Market analysis
- Competitive intelligence
- Customer insights

## Fabric Updates and Maintenance

### Updating Patterns
Fabric is an open-source project that receives regular pattern updates from the community:

```bash
# Update all patterns from GitHub repository
fabric -U
# or
fabric --updatepatterns
```

**Current Status:**
- **Patterns**: 226+ available in `~/.config/fabric/patterns/`
- **Last Update**: Check with `ls -la ~/.config/fabric/patterns/`

### Installation Details
- **Config Directory**: `~/.config/fabric/`
- **Extensions**: Custom extensions in `~/.config/fabric/extensions/`
- **Contexts**: Context management in `~/.config/fabric/contexts/`
- **Sessions**: Session storage in `~/.config/fabric/sessions/`
- **Environment**: Configuration in `~/.config/fabric/.env`

### Basic Usage Commands
```bash
# List available patterns
fabric --list-patterns

# Use with URL scraping
fabric -u $URL -p pattern_name

# Use with file input
fabric -p pattern_name < input.txt

# Use with direct input
echo "content" | fabric -p pattern_name

# Save output for later use with your commands
fabric -u $URL -p analyze_claims > analysis.txt
```

## Best Practices

### Separation of Concerns
1. **Keep Fabric Independent** - Use Fabric as a standalone research and analysis tool
2. **Complement, Don't Integrate** - Let Fabric output inform your custom commands
3. **Clear Workflows** - Use Fabric for preprocessing, then apply custom commands
4. **Documentation** - Keep clear records of which Fabric patterns work best for different tasks

### Effective Pattern Usage
1. **Pattern Selection** - Choose the most relevant patterns for each task
2. **Input Preparation** - Format input appropriately for pattern requirements
3. **Output Processing** - Structure Fabric output for downstream processing
4. **Regular Updates** - Run `fabric -U` regularly to get new community patterns

### Workflow Design
1. **Research Phase** - Use Fabric patterns for initial analysis and research
2. **Processing Phase** - Apply your custom commands to the researched data
3. **Quality Control** - Cross-reference Fabric analysis with agent expertise
4. **Documentation** - Maintain logs of effective Fabric pattern combinations

## Security Considerations

- **API Keys**: Fabric integrations may require API keys for external services
- **Data Privacy**: Be mindful of sensitive data when using web scraping features
- **Access Control**: Fabric patterns have access to system resources
- **Audit Trail**: Maintain logs of Fabric usage for security review

## Advanced Usage

### Custom Pattern Development
Create custom patterns in `~/.config/fabric/patterns/` for specialized use cases specific to your work

### Extension Development
Develop custom extensions in `~/.config/fabric/extensions/` for workflow automation

### Strategy Customization
Customize processing strategies in `~/.config/fabric/strategies/` for specific requirements

### Pattern Discovery
- Browse patterns: `ls ~/.config/fabric/patterns/`
- Explore pattern categories: Analysis, Content, Technical, Business
- Test patterns with sample data before using in workflows
- Document effective pattern combinations for future reference

## Relationship to Your Claude Infrastructure

Fabric operates as a **complementary external tool** alongside your Claude infrastructure:

- **Your Custom Commands**: Local, proprietary workflows and automation
- **Fabric Patterns**: Open-source, community-driven AI analysis patterns
- **Integration Point**: Fabric output can inform and enhance your custom command inputs
- **Update Strategy**: Keep Fabric patterns current with `fabric -U` while maintaining your custom commands independently

This approach provides the best of both worlds: cutting-edge community patterns from Fabric and your specialized local automation through custom commands.