# Create D3 Visualization Command

## Purpose
Generate interactive data visualizations using D3.js for web applications, dashboards, and data storytelling.

## Usage
```bash
claude create-d3-visualization [data-source] [chart-type] [options]
```

## Agent Assignment
**Primary Agent:** `~/.claude/agents/engineer.md`
**Supporting Agent:** `~/.claude/agents/designer.md` (for visual design)

## Workflow

### 1. Data Analysis & Preparation
- Analyze data structure and format
- Identify key metrics and dimensions
- Clean and transform data for visualization
- Define visualization requirements and goals

### 2. Chart Design & Planning
- Select optimal chart type for data story
- Plan interactive features and animations
- Design responsive layout and styling
- Create accessibility-compliant visualizations

### 3. D3.js Implementation
- Set up SVG canvas and scales
- Implement data binding and updates
- Create smooth transitions and animations
- Add interactive features (tooltips, filtering, zooming)

### 4. Integration & Optimization
- Ensure responsive design across devices
- Optimize performance for large datasets
- Test browser compatibility
- Implement proper error handling

## Visualization Types

### Statistical Charts
- Bar charts and histograms
- Line charts and time series
- Scatter plots and bubble charts
- Box plots and violin plots

### Hierarchical Visualizations
- Tree diagrams and dendrograms
- Sunburst and treemap charts
- Network graphs and force layouts
- Sankey diagrams and flow charts

### Geographic Visualizations
- Choropleth maps and heat maps
- Point maps with clustering
- Flow maps and connection maps
- Custom geographic projections

### Specialized Charts
- Parallel coordinates plots
- Radar and spider charts
- Calendar heat maps
- Custom dashboard components

## Interactive Features
- Hover tooltips with detailed information
- Click interactions for data exploration
- Zoom and pan capabilities
- Dynamic filtering and sorting
- Smooth transitions between states
- Responsive design adaptations

## Technical Implementation
- Modern ES6+ JavaScript syntax
- TypeScript support for type safety
- Modular component architecture
- Performance optimization techniques
- Cross-browser compatibility
- Mobile-first responsive design

## Required Context Files
- `~/.claude/context/development/CLAUDE.md` - Development standards
- `~/.claude/context/design/style-guide.md` - Visual styling guidelines
- `~/.claude/context/architecture/ult-system-design.md` - System architecture

## Output Deliverables
- Complete D3.js visualization code
- HTML integration example
- CSS styling and responsive design
- Data preparation utilities
- Documentation and usage guide
- Performance optimization report