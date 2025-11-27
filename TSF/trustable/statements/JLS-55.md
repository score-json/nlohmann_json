---
level: 1.1
normative: true
---

In eclipse-score/inc_nlohmann_json, a GitHub workflow tracks CI pipeline duration (build + tests) over time. If the median runtime increases beyond a defined relative threshold compared to a rolling baseline, the workflow flags the regression, blocks releases from the affected commit(s), and opens or updates an issue to investigate performance-related misbehaviours.