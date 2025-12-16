---
level: 1.1
normative: true
references: 
    - type: verbose_file
      path: "./.github/workflows/pr_count_gate.yml"
      description: "GitHub Actions workflow enforcing a limit on open PRs."
    - type: verbose_file
      path: "./.github/workflows/parent-workflow.yml"
      description: "Parent CI workflow that calls the pr_count_gate workflow."
---

In eclipse-score/inc_nlohmann_json, a GitHub Actions workflow checks the number of open pull requests in the main branch. If the number exceeds a defined threshold, the workflow fails and blocks further merges until the number of open pull requests is reduced below that threshold.
