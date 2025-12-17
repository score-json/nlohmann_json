---
level: 1.1
normative: true
references:
    - type: verbose_file
      path: "./TSF/docs/list_of_test_environments.md"
      comment: "The list of all test-cases together with their execution environments"
evidence:
    type: check_list_of_tests
    configuration: 
        sources:
            - "./tests/src"
            - "./TSF/tests"
---

A list of tests, which is extracted from the test execution, is provided, along with a list of test environments.