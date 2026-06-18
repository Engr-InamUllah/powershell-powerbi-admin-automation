# PowerShell Power BI Admin Automation

PowerShell automation for Power BI workspace inventory, refresh monitoring, access reviews, and administrative reporting.

## Architecture

`	ext
Power BI API -> PowerShell collectors -> CSV/JSON -> Admin report
`

## Technology stack

PowerShell, Power BI REST API, Microsoft Entra ID

## Planned deliverables

- Reproducible sample dataset and documented contracts
- Parameterized ingestion and transformation components
- Automated schema, null, duplicate, and business-rule checks
- Audit logging, rejected-record handling, and run metrics
- CI checks plus sample outputs or dashboard screenshots

## Delivery phases

1. Foundation and representative source data
2. Incremental pipeline implementation
3. Dimensional or analytical serving model
4. Testing, observability, and failure recovery
5. Demonstration assets and operational documentation

## Status

Portfolio scaffold established; implementation work is organized through project.yaml.