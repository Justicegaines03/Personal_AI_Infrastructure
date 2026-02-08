# Add Links Command

## Purpose
Enrich blog posts and content with relevant internal and external links to improve SEO, user experience, and content authority.

## Usage
```bash
claude add-links [content-file] [options]
```

## Agent Assignment
**Primary Agent:** `~/.claude/agents/marketer.md`

## Workflow

### 1. Content Analysis
- Parse existing content for link opportunities
- Identify key terms and phrases suitable for linking
- Analyze content context and user intent
- Map content to linking strategy

### 2. Internal Link Discovery
- Search existing site content for relevant articles
- Identify cornerstone content and pillar pages
- Find related topics and supporting content
- Create logical link hierarchy and flow

### 3. External Link Research
- Find authoritative external sources
- Verify link quality and domain authority
- Ensure relevance and value to readers
- Check for broken or outdated links

### 4. Link Implementation
- Insert links naturally within content flow
- Use descriptive and keyword-rich anchor text
- Balance link density for optimal SEO
- Ensure proper link attributes (nofollow, target)

## Link Strategy

### Internal Linking
- Link to related blog posts and pages
- Connect to product/service pages when relevant
- Reference cornerstone content and guides
- Create topic clusters and content silos

### External Linking
- Reference authoritative industry sources
- Link to research studies and statistics
- Cite expert opinions and case studies
- Provide additional resources for readers

## Quality Standards
- Links must add genuine value to readers
- Anchor text should be natural and descriptive
- Link destination must be relevant and high-quality
- Maintain healthy link-to-content ratio

## Required Context Files
- `~/.claude/context/projects/website/CLAUDE.md` - Site structure
- `~/.claude/context/design/style-guide.md` - Link styling guidelines

## Output Format
- Updated content with integrated links
- Link audit report with recommendations
- Internal link map and suggestions
- External source validation and quality score