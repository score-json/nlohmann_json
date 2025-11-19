---
level: 1.1
normative: false
---

**Guidance**

This assertion requires control over all changes to XYZ, including configurations, components, tools, data, documentation, and dependency versions used to build, verify, and validate it.

As part of change control, all automated checks must run and pass (e.g., tests, static analysis, lint checks) before accepting proposed changes.
These checks must be configured against appropriate claims and coding guidelines.
Where a change affects tracked claims, the impact must be identified, reasoned, and verified, with linked analysis performed (e.g., input analysis for new dependencies as per TA-INPUTS).
Even changes with no direct impact on project claims must be justified.

Multiple roles (assigned to appropriate parties under suitable guidelines) should be involved in assessing changes.
Reviews must focus on the integrity and consistency of claims, the software, and its tests.
What each reviewer did or did not examine must be recorded, and this information (together with all checks) made available for every change throughout the project lifecycle (see TA-DATA).
Details of manual quality management aspects are addressed in TA-METHODOLOGIES.

As a result, all changes must be regression-free (blocking problematic changes until resolved) and aim to exhibit the following properties:

- simple
- atomic
- modular
- understandable
- testable
- maintainable
- sustainable

Practices that enforce these properties help identify and resolve inconsistent changes early in development.

Change control itself must not be subverted, whether accidentally or maliciously.
Process documentation, guidance, and automated checks must also be under change control, approved by appropriate parties, and protected with suitable security controls.

To prevent regressions and reduce the rate of bugs and vulnerabilities, consistent dependency updates must be applied and new issues promptly addressed (TA-FIXES).
Evidence for each iteration must demonstrate that change control requirements are applied consistently and evolve as improvements are identified, ensuring the process remains repeatable and reproducible.
Timeliness must be monitored across detection, resolution, and deployment, with automation and process improvements introduced where delays are found.

Ultimately, the trustable controlled process is the only path to production for the constructed target software.

**Evidence**

- change management process and configuration artifacts
  - **Answer**: 

**Confidence scoring**

Confidence scoring for TA-UPDATES is based on confidence that we have
control over the changes that we make to XYZ, including its configuration and
dependencies.

**Checklist**

- Where are the change and configuration management controls specified?
  - **Answer**: 
- Are these controls enforced for all of components, tools, data, documentation and configurations?
  - **Answer**: 
- Are there any ways in which these controls can be subverted, and have we mitigated them?
  - **Answer**: 
- Does change control capture all potential regressions?
  - **Answer**: 
- Is change control timely enough?
  - **Answer**: 
- Are all guidance and checks understandable and consistently followed?
  - **Answer**: 
