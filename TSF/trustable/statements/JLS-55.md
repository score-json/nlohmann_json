---
level: 1.1
normative: true
references: 
    - type: verbose_file
      path: "./.github/workflows/pr_count_gate.yml"
      description: "GitHub Actions workflow enforcing a limit on open PRs."
evidence:
  type: "check_artifact_exists"
  configuration:
      ubuntu: exclude
      coverage_gate: exclude
      codeql: exclude
      labeler: exclude
      test_trudag_extensions: exclude
      dependency_review: exclude
      check_amalgamation: exclude
      publish_documentation: exclude
      pr_count_gate: include
---

In eclipse-score/inc_nlohmann_json, a GitHub Actions workflow checks the number of open pull requests in the main branch. If the number exceeds a defined threshold, the workflow fails and blocks further merges until the number of open pull requests is reduced below that threshold.
