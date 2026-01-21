---
level: 1.1
normative: true
references:
  - type: project_website
    url: "https://json.nlohmann.me/features/arbitrary_types/"
    description: "User guide for extending the library via serializers, including guidance for third-party types."
  - type: project_website
    url: "https://json.nlohmann.me/features/namespace/"
    description: "Documentation of the inline-namespace mechanism for modular use of multiple versions/configurations, including its limitations."
  - type: project_website
    url: "https://json.nlohmann.me/integration/migration_guide/"
    description: "Migration guidance on namespace/version/configuration handling to avoid integration pitfalls."
evidence:
    type: https_response_time
    configuration:
        target_seconds: 2
        urls:
            - "https://json.nlohmann.me/features/arbitrary_types/"
            - "https://json.nlohmann.me/features/namespace/"
            - "https://json.nlohmann.me/integration/migration_guide/"
---

The nlohmann/json documentation provides user-facing guidance for extensibility and modular integration, explicitly documenting limitations and constraints of extension interfaces.
