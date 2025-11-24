---
level: 1.1
normative: false
---

(Note: The guidance, evidence, confidence scoring and checklist sections below are copied from [CodeThink's documentation of TSF](https://codethinklabs.gitlab.io/trustable/trustable/trustable/TA.html). However, the answers to each point in the evidence list and checklist are specific to this project.)

**Guidance**

This assertion is satisfied if results from all tests and monitored deployments are captured accurately, ensuring:

- Sufficient precision for meaningful analysis
- Enough contextual information to reproduce the setup (e.g., runner ID, software version SHA), though not necessarily the exact results

Monitored deployments run in both production and development, validating monitoring mechanisms across environments and ensuring comparable results.
Collecting and retaining all data that support project claims (together with traceability to reasoning and specifications, and including both established and experimental indicators as well as test data from all environments) preserves evidence for selecting appropriate measures and enables historical analysis.

To avoid misinterpretation, all data storage mechanisms and locations are documented, together with long-term storage strategies, so analyses can be reliably reproduced.
How this data is made accessible is assessed as part of TA-ITERATIONS.

Storage strategies should account for foreseeable malicious activities and privacy considerations when handling sensitive data, including how the data is managed during transit and at rest, and whether it can be accessed in plaintext or only through appropriate tools (also considered for TA-INPUTS and TA-TESTS).

Appropriate storage strategies safeguard availability across the product lifecycle, with emphasis on release-related data, and account for decommissioning, infrastructure teardown, and post-project backups.

**Evidence**

- Time-stamped and traceable result records for each test execution, linked to associated system under test version and specification references.
  - **Answer**: 
- List of monitored indicators, linked to associated specification version references.
  - **Answer**: 
- Time-stamped and traceable test-derived data for each indicator, linked to associated system under test version and indicator specifications references.
  - **Answer**: 
- List of monitored deployments, linked to associated version and configuration references.
  - **Answer**: 
- Time-stamped and traceable production data for each indicator, linked to associated deployment metadata and specification references.
  - **Answer**: 

**Confidence scoring**

Confidence scoring for TA-DATA quantifies the completeness of test results
(including pass/fail and performance) and the availability of data from all
monitored deployments.

**Checklist**

- Is all test data stored with long-term accessibility?
  - **Answer**: 
- Is all monitoring data stored with long-term accessibility?
  - **Answer**: 
- Are extensible data models implemented?
  - **Answer**: 
- Is sensitive data handled correctly (broadcasted, stored, discarded, or anonymised) with appropriate encryption and redundancy?
  - **Answer**: 
- Are proper backup mechanisms in place?
  - **Answer**: 
- Are storage and backup limits tested?
  - **Answer**: 
- Are all data changes traceable?
  - **Answer**: 
- Are concurrent changes correctly managed and resolved?
  - **Answer**: 
- Is data accessible only to intended parties?
  - **Answer**: 
- Are any subsets of our data being published?
  - **Answer**: 

