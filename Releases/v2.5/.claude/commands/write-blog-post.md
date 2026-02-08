# Write Blog Post Command

## Purpose
AI-powered blog writing with SEO optimization, audience targeting, and brand voice consistency.

## Usage
```bash
claude write-blog-post [topic] [options]
```

## Agent Assignment
**Primary Agent:** `~/.claude/agents/marketer.md`
**Supporting Agent:** `~/.claude/agents/designer.md` (for visual elements)

## Workflow

### 1. Content Research & Planning
- Analyze topic relevance and search volume
- Identify target keywords and semantic terms
- Research competitor content and differentiation opportunities
- Define content structure and key points

### 2. Content Creation
- Generate compelling headline variations
- Create engaging introduction with hook
- Develop structured body content with subheadings
- Craft strong conclusion with call-to-action

### 3. SEO Optimization
- Optimize for target keywords naturally
- Create meta description and title tag
- Structure content for featured snippets
- Add internal and external linking opportunities

### 4. Quality Assurance
- Check content for brand voice consistency
- Verify factual accuracy and citations
- Ensure readability and flow
- Validate SEO elements and structure

## Required Context Files
- `~/.claude/context/projects/website/content/CLAUDE.md` - Writing standards
- `~/.claude/context/design/style-guide.md` - Brand guidelines
- `~/.claude/context/tools/CLAUDE.md` - Available tools

## Output Format
- Complete blog post in markdown format
- SEO metadata (title, description, keywords)
- Suggested images and visual elements
- Social media promotion copy
- Internal linking suggestions

## Quality Checklist
- [ ] Compelling headline and meta description
- [ ] Clear value proposition in introduction
- [ ] Logical content structure with subheadings
- [ ] Natural keyword integration
- [ ] Strong call-to-action
- [ ] Fact-checked and cited sources
- [ ] Brand voice consistency
- [ ] Readability optimization