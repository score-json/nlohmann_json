---
level: 1.1
normative: true
references:
  - type: project_website
    url: "https://json.nlohmann.me/community/quality_assurance/"
    description: "Quality-assurance overview that lists the static analysis tools (e.g., clang-tidy / Clang Static Analyzer) and dynamic analysis tools (e.g., Valgrind / Clang Sanitizers) and states that violations fail the build."
  - type: project_website
    url: "https://github.com/nlohmann/json/actions"
    description: "Public GitHub Actions run history showing the outcomes of CI jobs over time including the logs for the static code analysis tools."
  - type: website
    url: "https://app.codacy.com/gh/nlohmann/json/dashboard"
    description: "Codacy dashboard for nlohmann/json"
  - type: website
    url: "https://coveralls.io/github/nlohmann/json"
    description: "Coveralls dashboard for nlohmann/json, including coverage history/statistics (trend view)."
evidence:
  type: https_response_time
  configuration:
    target_seconds: 2
    urls:
      - "https://json.nlohmann.me/community/quality_assurance/"
      - "https://github.com/nlohmann/json/actions"
      - "https://app.codacy.com/gh/nlohmann/json/dashboard"
      - "https://coveralls.io/github/nlohmann/json"
score:
    Erikhu1: 0.9
---

The nlohmann/json repository uses static code analysis tools and sanitizers.