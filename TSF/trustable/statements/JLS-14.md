---
level: 1.1
normative: true
references:
    - type: website
      url: "https://github.com/nlohmann/json/tree/v3.12.0"
      description: "release site of nlohmann/json containing the sha values"
    - type: verbose_file
      path: ".github/workflows/check_amalgamation.yml"
      description: "Lines 68-77 checks that the amalgamate.py script always produces the same output with the same inputs, by comparing the single-include header file in the PR with a re-generated one inside the workflow run."
evidence:
    type: sha_checker
    configuration:
        binary: "./single_include/nlohmann/json.hpp"
        sha: "aaf127c04cb31c406e5b04a63f1ae89369fccde6d8fa7cdda1ed4f32dfc5de63"
---

The SHA value of the nlohmann/json library in use within eclipse-score/nlohmann_json coincides with the SHA value provided by Niels Lohmann for that version.
