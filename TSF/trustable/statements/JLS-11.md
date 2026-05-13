---
level: 1.1
normative: true
references:
    - type: verbose_file
      path: "./TSF/docs/nlohmann_misbehaviours_comments.md"
      description: "List of known nlohmann/json misbehaviours together with comments on whether they are relevant for S-CORE."
evidence:
    type: check_issues
    configuration:
      release_date: "2025-04-11T08:43:39Z"
      list_of_known_misbehaviours: "./TSF/docs/nlohmann_misbehaviours_comments.md"
score:
    Erikhu1: 1.0
    aschemmel-tech: 0.8
    ThomasClausnitzer: 0.9
---

Outstanding bugs or misbehaviours are analysed within eclipse-score/inc_nlohmann_json to determine whether they are relevant for S-CORE's use cases of the nlohmann/json library.

aschemmel-tech: most but not all issues are analysed for impact on S-CORE.
