---
level: 1.1
normative: true
references:
        - type: project_website
          url: "https://github.com/nlohmann/json/blob/55f93686c01528224f448c19128836e7df245f72/.github/workflows/ubuntu.yml"
          description: "Ubuntu workflow containing specific SHA commits in lines "
evidence:
        type: https_response_time
        configuration:
                target_seconds: 2
                urls:
                    - "https://github.com/nlohmann/json/blob/develop/.github/workflows/ubuntu.yml"
---

Any Github Actions used in the testing process are pinned to specific commit SHAs to ensure consistent action behavior across runs.
