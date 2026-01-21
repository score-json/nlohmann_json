---
level: 1.1
normative: true
references: 
    - type: verbose_file
      path: "./.github/workflows/coverage_gate.yml"
      description: "GitHub Actions workflow enforcing a minimum coverage threshold."
evidence:
  type: "check_artifact_exists"
  configuration:
      ubuntu: exclude
      coverage_gate: include
      codeql: exclude
      labeler: exclude
      test_trudag_extensions: exclude
      dependency_review: exclude
      check_amalgamation: exclude
      publish_documentation: exclude
      pr_count_gate: exclude
---

In the eclipse-score/inc_nlohmann_json repository, code coverage is measured in CI and a minimum threshold is enforced for pull requests into main and pushes to main. If coverage falls below the threshold, the coverage_gate check fails and blocks merging into main until coverage is restored.