# YouTube to Blog Command

## Purpose
Convert YouTube videos into comprehensive blog posts with SEO optimization, maintaining the original value while adapting for written format.

## Usage
```bash
claude youtube-to-blog [youtube-url] [target-audience] [options]
```

## Agent Assignment
**Primary Agent:** `~/.claude/agents/marketer.md`
**Supporting Agent:** `~/.claude/agents/designer.md` (for visual elements)

## Workflow

### 1. Video Analysis & Content Extraction
- Extract video transcript and key timestamps
- Identify main topics and supporting points
- Capture visual elements and demonstrations
- Analyze audience engagement patterns (comments, likes)

### 2. Content Structure & Adaptation
- Transform spoken content into written format
- Create logical blog post structure with headers
- Adapt visual demonstrations into written explanations
- Integrate relevant screenshots and diagrams

### 3. SEO Optimization & Enhancement
- Research target keywords and search intent
- Optimize headlines and meta descriptions
- Add internal and external linking opportunities
- Create social media promotional content

### 4. Quality Enhancement & Fact-Checking
- Verify facts and add credible sources
- Enhance content with additional research
- Improve readability and flow
- Add actionable takeaways and summaries

## Content Transformation Process

### Transcript Processing
- Clean up filler words and verbal tics
- Convert spoken language to written format
- Maintain author's voice and personality
- Structure content with clear paragraphs

### Visual Content Integration
- Screenshot key visual moments
- Recreate diagrams and charts in blog format
- Describe visual demonstrations in text
- Create infographics for complex concepts

### Content Enhancement
- Add relevant statistics and data
- Include expert quotes and perspectives
- Provide historical context and background
- Insert practical examples and case studies

### SEO Optimization
- Keyword research and integration
- Meta title and description optimization
- Header structure (H1, H2, H3) optimization
- Schema markup for enhanced search visibility

## Output Components

### Blog Post Content
- Engaging introduction with hook
- Well-structured body with subheadings
- Actionable insights and takeaways
- Strong conclusion with call-to-action

### SEO Package
- Optimized title and meta description
- Target keyword list and integration
- Internal linking suggestions
- Social sharing optimization

### Visual Assets
- Featured image and thumbnails
- Screenshots and diagrams from video
- Custom graphics and infographics
- Social media promotional images

### Promotional Content
- Social media posts for distribution
- Email newsletter content
- LinkedIn article adaptation
- Twitter thread breakdown

## Content Types & Adaptations

### Educational/Tutorial Videos
- Step-by-step written instructions
- Downloadable resources and templates
- FAQ sections for common questions
- Troubleshooting guides and tips

### Interview/Podcast Style
- Q&A format with key insights
- Expert bio and background
- Quote highlights and pullouts
- Follow-up resources and links

### Product Demos/Reviews
- Feature comparison tables
- Pros and cons analysis
- Use case scenarios and examples
- Purchase recommendations and links

### Thought Leadership
- Main argument and supporting points
- Industry context and implications
- Contrarian viewpoints and discussions
- Future predictions and recommendations

## Required Context Files
- `~/.claude/context/projects/website/content/CLAUDE.md` - Content standards
- `~/.claude/context/design/style-guide.md` - Visual guidelines

## Quality Checklist
- [ ] Transcript accurately converted to written format
- [ ] Visual elements properly described or recreated
- [ ] SEO optimization completed
- [ ] Content enhanced with additional value
- [ ] Author's voice and expertise preserved
- [ ] Actionable takeaways clearly identified
- [ ] Proper attribution and credits included