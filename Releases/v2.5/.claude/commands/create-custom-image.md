# Create Custom Image Command

## Purpose
Generate contextual, brand-consistent images for blog posts, social media, and marketing materials using AI image generation.

## Usage
```bash
claude create-custom-image [description] [type] [dimensions] [options]
```

## Agent Assignment
**Primary Agent:** `~/.claude/agents/designer.md`
**Supporting Agent:** `~/.claude/agents/marketer.md` (for brand messaging)

## Workflow

### 1. Image Concept Development
- Analyze content context and purpose
- Define visual style and aesthetic direction
- Incorporate brand guidelines and color palette
- Determine optimal image type and format

### 2. Prompt Engineering
- Create detailed AI image generation prompts
- Specify technical requirements (resolution, format)
- Include brand elements and style guidelines
- Define composition and visual hierarchy

### 3. Image Generation & Iteration
- Generate initial image concepts
- Evaluate against brand standards and context
- Refine prompts for improved results
- Create variations for A/B testing

### 4. Post-Processing & Optimization
- Optimize images for web performance
- Add brand elements (logos, watermarks)
- Ensure accessibility compliance
- Create multiple format variations

## Image Types

### Blog Post Images
- Featured images and thumbnails
- In-line illustrations and diagrams
- Infographic elements and charts
- Section headers and dividers

### Social Media Graphics
- LinkedIn post visuals
- Twitter card images
- Instagram story templates
- YouTube thumbnails

### Marketing Materials
- Landing page headers
- Email newsletter graphics
- Advertisement visuals
- Presentation slides

## Brand Consistency
- Use approved color palette and fonts
- Maintain visual style consistency
- Include subtle brand elements
- Follow accessibility guidelines

## Technical Specifications
- Web-optimized file sizes
- Multiple format options (PNG, JPG, SVG)
- Responsive image variants
- SEO-friendly file names and alt text

## Required Context Files
- `~/.claude/context/design/style-guide.md` - Visual standards
- `~/.claude/context/design/design-principles.md` - Brand guidelines

## Output Deliverables
- Generated image files in multiple formats
- Image prompt documentation
- Usage guidelines and alt text
- Performance optimization report