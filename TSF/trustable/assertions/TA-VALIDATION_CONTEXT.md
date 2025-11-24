---
level: 1.1
normative: false
---

(Note: The guidance, evidence, confidence scoring and checklist sections below are copied from [CodeThink's documentation of TSF](https://codethinklabs.gitlab.io/trustable/trustable/trustable/TA.html). However, the answers to each point in the evidence list and checklist are specific to this project.)

**Guidance**

This assertion is satisfied when tests demonstrate that the features specified to meet project Expectations (TT-EXPECTATIONS) are present and function as intended.
These tests run repeatedly in a controlled environment (TA-TESTs) on a defined schedule (e.g., daily, per change, or per candidate release of nlohmann/json).

Confidence grows when tests not only verify Expectations but also validate (continuously) that they meet stakeholder and user needs.
Robust validation depends on three aspects:

- TA-VALIDATION – a strategy that produces representative and stressing data.
- TA-DATA – appropriate handling of collected data.
- TA-ANALYSIS – analysis methods that remain dependable as the project evolves.

This structure enables iterative convergence toward required behaviours, even when early validation results are unsatisfactory.

A strategy to generate appropriate data addresses quantity, quality, and selection:

- Selection: Testing remains exploratory, combining monitoring with verified and new indicators (supporting TA-INDICATORS). 
  Coverage spans input, design, and output analysis with traceable specifications and results (considering TA-BEHAVIOURS).
  Tests also support calibration of capacity, scalability, response time, latency, and throughput, executed in targetted conditions and under stress (e.g., equivalence class and boundary-value testing).
- Quantity: Automation scheduling provides sufficient repetition and covers diverse environments (e.g., multiple hardware platforms).
  Failures block merge requests, with pre- and post-merge tests giving fast feedback.
  Adequacy of data is assessed through TA-ANALYSIS.
- Quality: Test suites include fault induction (considering TA-MISBEHAVIOURS) and checks that good data yields good results while bad data yields bad results.

**Evidence**

- Test results from per-change tests
  - **Answer**: 
- Test results from scheduled tests as time series
  - **Answer**: 

**Confidence scoring**

Confidence scoring for TA-VALIDATION is based on verification that we have
results for all expected tests (both pass / fail and performance).

**Checklist**

- Is the selection of tests correct?
  - **Answer**: 
- Are the tests executed enough times?
  - **Answer**: 
- How confident are we that all test results are being captured?
  - **Answer**: 
- Can we look at any individual test result, and establish what it relates to?
  - **Answer**: 
- Can we trace from any test result to the expectation it relates to?
  - **Answer**: 
- Can we identify precisely which environment (software and hardware) were used?
  - **Answer**: 
- How many pass/fail results would be expected, based on the scheduled tests?
  - **Answer**: 
- Do we have all of the expected results?
  - **Answer**: 
- Do we have time-series data for all of those results?
  - **Answer**: 
- If there are any gaps, do we understand why?
  - **Answer**: 
- Are the test validation strategies credible and appropriate?
  - **Answer**: 
- What proportion of the implemented tests are validated?
  - **Answer**: 
- Have the tests been verified using known good and bad data?
  - **Answer**: 
