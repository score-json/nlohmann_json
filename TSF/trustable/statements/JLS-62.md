---
level: 1.1
normative: true
references:
  - type: file
    path: ./cmake/ci.cmake
    description: "Contains -LE not_reproducible parameter in line 494 of the cmake file."
---

By including the optional "-LE not_reproducible" flag in the ci.cmake file of eclipse-score/inc_nlohmann_json, all tests executed within eclipse-score/inc_nlohmann_json are reproducible.