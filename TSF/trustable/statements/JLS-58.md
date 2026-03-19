---
level: 1.1
normative: true
references:
    - type: website
      url: "https://github.com/eclipse-score/inc_nlohmann_json/actions"
      description: "GitHub Actions page showing that eclipse-score/inc_nlohmann_json is using a GitHub-hosted environment."
evidence:
    type: https_response_time
    configuration:
      target_seconds: 2
      urls:
          - "https://github.com/eclipse-score/inc_nlohmann_json/actions"
---

GitHub-hosted runners are used as the test environment for eclipse-score/inc_nlohmann_json.
