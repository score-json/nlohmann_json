---
level: 1.1
normative: true
references: 
    - type: verbose_file
      path: "./.github/workflows/coverage_gate.yml"
      description: "GitHub Actions workflow enforcing a minimum coverage threshold."
    - type: verbose_file
      path: "./.github/workflows/parent-workflow.yml"
      description: "Parent CI workflow that calls the coverage_gate workflow."
---

In the eclipse-score/inc_nlohmann_json repository, code coverage for unit and integration tests is measured in every CI run, and a minimum coverage threshold is defined for each protected branch. If coverage for a change would fall below this threshold, the CI workflow blocks the merge until coverage is restored or the change is rejected.