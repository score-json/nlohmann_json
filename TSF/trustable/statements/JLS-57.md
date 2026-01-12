---
level: 1.1
normative: true
references:
    - type: website
      url: "https://github.com/eclipse-score/inc_nlohmann_json/blob/save_historical_data/TSF/misbehaviours.md"
      description: "List of outstanding bugs as well as fixes for developed code that are outstanding, not yet applied."
evidence:
    type: https_response_time
    configuration:
        target_seconds: 2
        urls:
            - "https://github.com/eclipse-score/inc_nlohmann_json/blob/save_historical_data/TSF/misbehaviours.md"
---

Outstanding bugs or misbehaviours of nlohmann/json are fetched and saved within eclipse-score/inc_nlohmann_json.