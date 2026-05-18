---
level: 1.1
normative: true
references:
    - type: website
      url: "https://coveralls.io/github/nlohmann/json"
      description: "Coverage report for the nlohmann/json library."
evidence:
    type: coveralls_reporter
    configuration:
      owner: "eclipse-score"
      repo: "nlohmann_json"
      branch: "main"
      line_coverage: 99.186
      branch_coverage: 93.865
      significant_decimal_digits: 3
score:
    ThomasClausnitzer: 0.95
---

The test coverage for this version of nlohmann/json is monitored using Coveralls and is not decreasing over time, unless reasonably justified.