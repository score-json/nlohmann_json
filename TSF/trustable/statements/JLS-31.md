---
level: 1.1
normative: true
references:
        - type: project_website
          url: "https://scorecard.dev/viewer/?uri=github.com%2Fnlohmann%2Fjson"
          description: "OpenSSF Scorecard Report for nlohmann/json, where score for 'SAST' supports this statement."
        - type: project_website
          url: "https://json.nlohmann.me/community/quality_assurance/#static-analysis"
          description: "Documents static analysis and dynamic analysis practices used."
evidence:
        type: https_response_time
        configuration:
                target_seconds: 2
                urls:
                    - "https://scorecard.dev/viewer/?uri=github.com%2Fnlohmann%2Fjson"
                    - "https://json.nlohmann.me/community/quality_assurance/#static-analysis"
score:
    Erikhu1: 0.9
---

The nlohmann/json repository uses a static code analysis tool.