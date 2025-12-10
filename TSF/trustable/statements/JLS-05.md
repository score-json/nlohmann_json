---
level: 1.1
normative: true
references:
    - type: project_website
      url: "https://github.com/nlohmann/json/issues"
      description: "Contains the collected Github issues for the nlohmann/json library."
    - type: project_website
      url: "https://github.com/nlohmann/json/graphs/commit-activity"
      description: "Presents the commit activity of the past year."
    - type: project_website
      url: "https://github.com/nlohmann/json/graphs/contributors"
      description: "Presents commits over time and per contributor."
    - type: project_website
      url: "https://github.com/nlohmann/json/forks?include=active&page=1&period=&sort_by=last_updated"
      description: "Lists all forks of the nlohmann/json library by last updated."
    - type: project_website
      url: "https://github.com/nlohmann/json/pulse"
      description: "Presents the activity on the nlohmann/json library over the past week."
    - type: project_website
      url: "https://github.com/orgs/score-json/discussions/27#discussion-8594385"
      description: "Comparison between JSON libraries demonstrating the popularity of the nlohmann/json library."
    - type: project_website
      url: "https://json.nlohmann.me/home/customers/"
      description: "Presents a subset of all customers who are using the nlohmann/json library."
    - type: web_content
      url: "https://github.com/nlohmann/json/releases/tag/v3.12.0"
      description: "Release notes for v3.12.0, listing bugs, CVEs and warnings which were either fixed or mitigated since last release."
    - type: project_website
      url: "https://github.com/nlohmann/json/releases/tag/v3.12.0"
      description: "release notes for v3.12.0, listing bugs, CVEs and warnings which were either fixed or mitigated since last release"
evidence:
  type: https_response_time
  configuration:
          target_seconds: 2
          urls:
              - "https://github.com/nlohmann/json/issues"
              - "https://github.com/nlohmann/json/graphs/commit-activity"
              - "https://github.com/nlohmann/json/graphs/contributors"
              - "https://github.com/nlohmann/json/forks?include=active&page=1&period=&sort_by=last_updated"
              - "https://github.com/nlohmann/json/pulse"
              - "https://github.com/orgs/score-json/discussions/27#discussion-8594385"
              - "https://json.nlohmann.me/home/customers/"
              - "https://github.com/nlohmann/json/releases/tag/v3.12.0"
score:
    Jonas-Kirchhoff: 1.0
    Erikhu1: 1.0
---

The nlohmann/json library is widely used and actively maintained; bugs and misbehaviours are tracked publicly and transparently.
