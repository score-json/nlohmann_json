---
level: 1.1
normative: true
---

In eclipse-score/inc_nlohmann_json, test flakiness is monitored by tracking repeated executions and outcome history of individual tests. If a test shows inconsistent pass/fail behaviour above a defined flakiness threshold the test is automatically quarantined or marked as flaky in CI, new failures of that test are treated as potential misbehaviours and analysed, and an issue or misbehaviour entry is created and linked in the Trustable Graph.