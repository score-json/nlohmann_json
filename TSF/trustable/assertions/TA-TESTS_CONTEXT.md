---
level: 1.1
normative: false
---

(Note: The guidance, evidence, confidence scoring and checklist sections below are copied from [CodeThink's documentation of TSF](https://codethinklabs.gitlab.io/trustable/trustable/trustable/TA.html). However, the answers to each point in the evidence list and checklist are specific to this project.)

**Guidance**

This assertion is satisfied if all build and test environments and tools used to support Expectations are shown to be
*reproducible*, all build and test steps are *repeatable*, and all required inputs are controlled.
TA-TESTS does not include reproducibility of nlohmann/json itself, this is instead included in TA-RELEASES.

All tools and test environments should be constructed from change-managed sources (see TA-UPDATES) and mirrored
sources (see TA-SUPPLY_CHAIN).
Additional evidence needs to demonstrate that construction of tools and environments produces the same binary fileset
used for testing and that builds can be repeated on any suitably configured server
(similar to how the nlohmann/json is evaluated for TA-RELEASES).

Test environment repeatability should be ensured to enable effective Misbehaviour investigations, and enable additional
data generations (including those by third parties).
To achieve repeatability, all infrastructure, hardware, and configurations must be identified and documented for all
test environments. Storage of this information is evaluated in TA-DATA, and its availability is considered in
TA-ITERATIONS.

**Evidence**

- Test build environment reproducibility
  - **Answer**: 
- Test build configuration
  - **Answer**: 
- Test build reproducibility
  - **Answer**: 
- Test environment configuration
  - **Answer**: 

**Confidence scoring**

Confidence scoring for TA-TESTS is based on confidence that the construction and deployment of test environments,
tooling and their build environments are repeatable and reproducible.

**CHECKLIST**

- How confident are we that our test tooling and environment setups used for tests, fault inductions, and analyses are reproducible?
  - Are any exceptions identified, documented and justified?
    - **Answer**: 
- How confident are we that all test components are taken from within our controlled environment?
  - **Answer**: 
- How confident are we that all of the test environments we are using are also under our control?
  - **Answer**: 
- Do we record all test environment components, including hardware and infrastructure used for exercising tests and processing input/output data?
  - **Answer**: 
- How confident are we that all tests scenarios are repeatable?
  - **Answer**: 
