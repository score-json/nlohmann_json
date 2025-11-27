---
level: 1.1
normative: true
---

In eclipse-score/inc_nlohmann_json, a GitHub workflow continuously monitors the fraction of failing unit and integration tests on protected branches (e.g., main, release branches). If the failure rate exceeds a defined threshold over a configurable number of consecutive runs, the workflow blocks further merges to the affected branch, and restores the last known-good commit (last fully passing pipeline) as the default basis for integration and release.
