---
level: 1.1
normative: true
---

In eclipse-score/inc_nlohmann_json, static analysis (e.g., clang-tidy, cppcheck) and GitHub code scanning results are monitored on each CI run. If new high-severity findings appear on protected branches merges introducing such findings are blocked, the affected findings are tracked until either fixed or explicitly justified and documented, and the corresponding changes are not included in a release until resolved or formally accepted.