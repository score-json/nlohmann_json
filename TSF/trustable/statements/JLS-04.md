---
level: 1.1
normative: true
references:
        - type: verbose_file
          path: ".github/workflows/dependency-review.yml"
          description: "The workflow scans PRs for dependency changes and vulnerabilities."
evidence:
  type: "check_artifact_exists"
  configuration:
      ubuntu: exclude
      coverage_gate: exclude
      codeql: exclude
      labeler: exclude
      test_trudag_extensions: exclude
      dependency_review: include
      check_amalgamation: exclude
      publish_documentation: exclude
      pr_count_gate: exclude
score:
    Jonas-Kirchhoff: 1.0
    Erikhu1: 1.0
    aschemmel-tech: 1.0
---

External dependencies within nlohmann/json are checked for potential security vulnerabilities with each pull request to main. Merging is blocked until all warnings are resolved.