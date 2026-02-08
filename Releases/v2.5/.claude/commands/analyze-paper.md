# Analyze Paper Command

## Purpose
Comprehensive academic paper analysis including methodology review, key findings extraction, and practical application identification.

## Usage
```bash
claude analyze-paper [paper-url-or-file] [analysis-depth] [options]
```

## Agent Assignment
**Primary Agent:** `~/.claude/agents/engineer.md` (for technical papers)
**Alternative Agents:** Based on paper domain
- `~/.claude/agents/marketer.md` (for business/marketing research)
- `~/.claude/agents/designer.md` (for UX/design research)

## Workflow

### 1. Paper Ingestion & Structure Analysis
- Extract and parse paper content (PDF, URL, or text)
- Identify paper structure (abstract, methodology, results, conclusion)
- Categorize paper type (empirical, theoretical, review, case study)
- Assess paper quality and publication venue

### 2. Content Analysis
- Summarize research problem and objectives
- Extract key hypotheses and research questions
- Analyze methodology and experimental design
- Identify data sources and sample characteristics

### 3. Findings & Results Evaluation
- Extract key findings and statistical results
- Assess significance and practical implications
- Identify limitations and potential biases
- Evaluate reproducibility and validity

### 4. Practical Application Assessment
- Identify actionable insights for implementation
- Assess relevance to current projects
- Extract best practices and recommendations
- Highlight potential risks and considerations

## Analysis Dimensions

### Methodology Review
- **Research Design**: Experimental, observational, or theoretical approach
- **Data Collection**: Methods, tools, and sources used
- **Sample Size**: Statistical power and representativeness
- **Controls**: Confounding variables and bias mitigation

### Statistical Analysis
- **Methods Used**: Statistical tests and analysis techniques
- **Effect Sizes**: Practical significance of findings
- **Confidence Intervals**: Uncertainty and precision measures
- **Reproducibility**: Availability of data and code

### Practical Relevance
- **Industry Applications**: Real-world use cases and implementations
- **Scalability**: Feasibility for different contexts and scales
- **Cost-Benefit**: Resource requirements and expected returns
- **Implementation Challenges**: Potential obstacles and solutions

### Quality Assessment
- **Peer Review**: Publication venue and review process quality
- **Citations**: Impact and recognition in academic community
- **Replication Studies**: Independent validation of findings
- **Author Expertise**: Research team background and credibility

## Output Deliverables

### Executive Summary
- 1-page overview for stakeholders
- Key findings and actionable insights
- Implementation recommendations
- Risk assessment and limitations

### Detailed Analysis Report
- Comprehensive methodology review
- Statistical analysis and interpretation
- Literature context and positioning
- Future research directions

### Practical Implementation Guide
- Step-by-step application instructions
- Resource requirements and timeline
- Success metrics and evaluation criteria
- Risk mitigation strategies

### Citation and Reference Package
- Properly formatted citations
- Related work and follow-up papers
- Author contact information
- Supplementary materials links

## Required Context Files
- `~/.claude/context/projects/CLAUDE.md` - Current project relevance assessment
- `~/.claude/context/architecture/principles.md` - Technical implementation standards

## Quality Checklist
- [ ] Methodology accurately summarized
- [ ] Key findings clearly extracted
- [ ] Statistical significance properly interpreted
- [ ] Practical applications identified
- [ ] Limitations and biases acknowledged
- [ ] Implementation feasibility assessed
- [ ] Proper citations and references included