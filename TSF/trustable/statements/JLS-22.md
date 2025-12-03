---
level: 1.1
normative: true
references:
    - type: verbose_file
      path: ./.github/workflows/parent-workflow.yml
      description: "Github workflow running daily and triggering the Ubuntu workflow."
    - type: verbose_file
      path: ./.github/workflows/ubuntu.yml
      description: "Workflow, in which unit tests are executed with a myriad of test environments, and test results are captured."
    - type: verbose_file
      path: ./TSF/scripts/capture_test_data.py
      description: "Script that collects the data produced by CTest in a database."
    - type: website
      url: "https://github.com/eclipse-score/inc_nlohmann_json/blob/save_historical_data/TSF/MemoryEfficientTestResultData.db"
      description: "The database containing the test results."
evidence:
    type: https_response_time
    configuration:
        target: 2.0
        urls:
            - https://github.com/eclipse-score/inc_nlohmann_json/blob/save_historical_data/TSF/MemoryEfficientTestResultData.db
score:
    Jonas-Kirchhoff: 1.0
---

A Github workflow of eclipse-score/inc_nlohmann_json executes the unit tests daily and saves the results as time-series data.