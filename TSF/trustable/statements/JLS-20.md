---
level: 1.1
normative: true
references: 
    - type: verbose_file
      path: ./.github/workflows/parent-workflow.yml
      description: "GitHub workflow running on push to main and triggering the workflow publish_documentation."
    - type: verbose_file
      path: ./.github/workflows/publish_documentation.yml
      description: "GitHub workflow executing calculation and storage of trustable scores."
    - type: website
      url: "https://github.com/eclipse-score/inc_nlohmann_json/blob/save_historical_data/TSF/TrustableScoring.db"
      description: "The database containing the trustable scores."
evidence:
    type: https_response_time
    configuration:
        target_seconds: 2
        urls:
            - "https://github.com/eclipse-score/inc_nlohmann_json/blob/save_historical_data/TSF/data_storage"
score:
    Jonas-Kirchhoff: 1.0
---

A GitHub workflow of eclipse-score/inc_nlohmann_json saves the history of scores in the trustable graph to derive trends.