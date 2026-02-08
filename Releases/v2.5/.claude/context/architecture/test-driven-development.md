# Test-Driven Development

## Overview

Adopt a “logs-first” approach: begin debugging by strategically placing logs (console.log, console.warn, console.error, or a custom logging utility) to track data flow, execution path, and variable values in your app.​

## Debugging Workflow: Logging First, Testing as a Follow-Up

1. Logging is immediate, lightweight, and excellent for quickly isolating issues, especially those that only arise under specific conditions or in production environments.​

2. Use log levels (debug/info/warn/error) to categorize and prioritize issues, and ensure logs can be toggled off in production to avoid performance penalties.​

3. Once an issue is clearly understood and a fix is in place, write a small test (unit, integration, or snapshot) to verify and guard against regressions in the future.​

4. This logging-then-testing sequence lets you rapidly iterate while you investigate, but also strengthens your codebase over time.​

5. Well-crafted tests are reusable and document correct behaviors, while logs remain diagnostic and are typically pruned as issues are fixed.