---
level: 1.1
normative: true
references:
  - type: project_website
    url: "https://github.com/nlohmann/json"
    description: "Start-page of the original nlohmann/json project"
  - type: project_website
    url: "https://github.com/eclipse-score/inc_nlohmann_json"
    description: "Start-page of the mirror of nlohmann/json within Eclipse S-CORE"
  - type: verbose_file
    path: ./single_include/nlohmann/json.hpp
    description: "Single include of the nlohmann/json library"
evidence:
  type: https_response_time
  configuration:
    target_seconds: 2
    urls:
      - "https://github.com/nlohmann/json"
      - "https://github.com/eclipse-score/inc_nlohmann_json"
      - 
---

All source code of the nlohmann/json library is mirrored within eclipse-score/inc_nlohmann_json.