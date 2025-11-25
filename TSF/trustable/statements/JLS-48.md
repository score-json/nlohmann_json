---
level: '1.1'
normative: true
references:
    - type: project_website
      url: "https://github.com/nlohmann/json#used-third-party-tools"
      description: "List of third party tools used to build, test and document nlohmann/json."
evidence:
        type: https_response_time
        configuration:
                target_seconds: 2
                urls:
                    - "https://github.com/nlohmann/json#used-third-party-tools"
score:
    Erikhu1: 1.0
---

The nlohmann/json project transparently lists any third party tools used in building, testing and documenting the project.