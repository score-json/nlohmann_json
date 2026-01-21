---
level: 1.1
normative: true
references:
  - type: project_website
    url: "https://json.nlohmann.me/features/macros/"
    description: "Configuration documentation via supported preprocessor macros."
  - type: project_website
    url: "https://json.nlohmann.me/integration/cmake/"
    description: "CMake integration documentation, including build options that map to configuration macros."
evidence:
    type: https_response_time
    configuration:
        target_seconds: 2
        urls:
            - "https://json.nlohmann.me/features/macros/"
            - "https://json.nlohmann.me/integration/cmake/"
---

The nlohmann/json library provides configuration manuals with worked examples.
