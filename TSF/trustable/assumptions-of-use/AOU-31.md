---
level: '1.1'
normative: true
---

The integrator shall ensure that JSON parsing and validation using eclipse-score/nlohmann_json is performed under integration-defined resource and time budgets (e.g., maximum input size, maximum nesting/structure complexity, and maximum processing time), and that suitable enforcement mechanisms are in place at the integration boundary to prevent hangs or resource exhaustion when processing untrusted or extreme inputs.

