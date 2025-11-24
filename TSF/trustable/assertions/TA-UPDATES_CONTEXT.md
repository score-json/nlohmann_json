---
level: 1.1
normative: false
---

(Note: The guidance, evidence, confidence scoring and checklist sections below are copied from [CodeThink's documentation of TSF](https://codethinklabs.gitlab.io/trustable/trustable/trustable/TA.html). However, the answers to each point in the evidence list and checklist are specific to this project.)

**Guidance**

This assertion requires control over all changes to nlohmann/json, including configurations, components, tools, data, documentation, and dependency versions used to build, verify, and validate it.

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
  - **Answer**: Provided in JLS-06, JLS-07, JLS-12, JLS-32, JLS-34, JLS-35 and AOU-27. 

**Confidence scoring**

Confidence scoring for TA-UPDATES is based on confidence that we have
control over the changes that we make to nlohmann/json, including its configuration and
dependencies.

**Checklist**

- Where are the change and configuration management controls specified?
  - **Answer**: In the [contribution guidelines](https://github.com/nlohmann/json?tab=contributing-ov-file#readme) and [security policy](https://github.com/nlohmann/json?tab=security-ov-file#readme). 
- Are these controls enforced for all of components, tools, data, documentation and configurations?
  - **Answer**: Yes. Any proposed change is subject to the same change controls.
- Are there any ways in which these controls can be subverted, and have we mitigated them?
  - **Answer**: No. The controls are enforced using branch protection rules and are mostly automated.
- Does change control capture all potential regressions?
  - **Answer**: Yes. All changes are tested in the branch '[develop](https://github.com/nlohmann/json/actions?query=branch%3Adevelop)' before being deployed to the master branch.
- Is change control timely enough?
  - **Answer**: The change control is indeed timely enough. Any [issues](https://github.com/nlohmann/json/issues) or [discussions](https://github.com/nlohmann/json/discussions) opened are addressed within a reasonable time frame.
- Are all guidance and checks understandable and consistently followed?
  - **Answer**: Yes. The [contribution guideline](https://github.com/nlohmann/json?tab=contributing-ov-file#readme) is clear and well-documented, and checks are enforced through automatic [CI workflows](https://github.com/nlohmann/json/tree/develop/.github/workflows).
