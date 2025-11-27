---
level: 1.1
normative: true
---

In eclipse-score/inc_nlohmann_json, code coverage for unit and integration tests is measured on each CI run. If coverage for any protected branch decreases by more than a defined threshold relative to the previous release baseline, the workflow blocks merges that introduce the regression, and requires either a compensating test update or a documented justification approved by a Subject Matter Expert.