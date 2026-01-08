---
level: 1.1
normative: true
references:
  - type: project_website
    url: "https://json.nlohmann.me/home/design_goals/"
    description: "Design goals describing the intended scope and trade-offs of the library."
  - type: project_website
    url: "https://json.nlohmann.me/api/basic_json/"
    description: "API reference describing the behavior and requirements of the core JSON type."
evidence:
  type: https_response_time
  configuration:
    target_seconds: 2
    urls:
      - "https://json.nlohmann.me/home/design_goals/"
      - "https://json.nlohmann.me/api/basic_json/"
---

The nlohmann/json project documents the intended scope and design trade-offs of the library and specifies the documented interface and behavior of its core JSON type via its API reference.
