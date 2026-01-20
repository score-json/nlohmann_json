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
  - **Answer**: Provided by JLS-18 and JLS-45.
- List of monitored indicators, linked to associated specification version references.
  - **Answer**: For eclipse-score/inc_nlohmann_json, no runtime monitoring indicators are defined because the component is a statically integrated, header-only library without long-running runtime behaviour in this repository context. The monitored indicators that are currently specified and collected are CI-/process-based: Coverage threshold gate (see JLS-54) and PR-count / review-load limit gate (see JLS-55).
- Time-stamped and traceable test-derived data for each indicator, linked to associated system under test version and indicator specifications references.
  - **Answer**: The CI collects time-stamped indicator data and links it to the tested commit SHA. The indicator specifications are referenced in JLS-54 (coverage gate) and JLS-55 (PR-count gate).
- List of monitored deployments, linked to associated version and configuration references.
  - **Answer**: Monitoring is performed via CI runs (coverage gate and PR-count gate) and is traceable to the tested commit SHA and the CI workflow configuration. There is no separate monitoring of production deployments in this repository context.
- Time-stamped and traceable production data for each indicator, linked to associated deployment metadata and specification references.
  - **Answer**: Not available. No production/runtime monitoring data is collected, only CI-derived, time-stamped indicator data is available via the CI artefacts and run history.

**Confidence scoring**

Confidence scoring for TA-DATA quantifies the completeness of test results
(including pass/fail and performance) and the availability of data from all
monitored deployments.

**Checklist**

- Is all test data stored with long-term accessibility?
  - **Answer**: Yes, the test results are collected into a persistent database as part of the CI workflows and pushed to the save_historical_data branch. To avoid hitting GitHub file size limits, the persistent database is automatically rotated into date-stamped files, while older files remain available for long-term access. 
- Is all monitoring data stored with long-term accessibility?
  - **Answer**: Monitoring data is currently collected via the CI and stored with long-term accessibility in the persistent CI data store on the save_historical_data branch. However, there is still no dedicated monitoring for runtime behaviour (and related aspects), so this part of monitoring data is not collected yet.
- Are extensible data models implemented?
  - **Answer**: Test-result data is stored in a SQLite database with separate tables for workflow runs and individual test results (see JLS-18). This schema can be extended with additional fields or tables if needed.
- Is sensitive data handled correctly (broadcasted, stored, discarded, or anonymised) with appropriate encryption and redundancy?
  - **Answer**: This is not explicitly applicable. The captured test data does not include personal or sensitive data.
- Are proper backup mechanisms in place?
  - **Answer**: No explicit project-level backup mechanism is defined beyond GitHub’s own infrastructure. The persistent test/scoring databases are stored and versioned on the save_historical_data branch, which provides history and recoverability via Git, but there is no separate off-platform backup process in place.
- Are storage and backup limits tested?
  - **Answer**: Storage limits are addressed in CI by checking the size of the persistent databases and rotating to a new date-stamped database file once a threshold is reached, to avoid hitting GitHub file size limits. There is no separate backup mechanism beyond GitHub/Git history.
- Are all data changes traceable?
  - **Answer**:  Yes, for both test and scoring data. Updates to the persistent databases (e.g. TSF/data_storage/MemoryEfficientTestResultData_*.db and TSF/data_storage/TrustableScoring_*.db) are performed by CI workflows and committed to the save_historical_data branch, so Git history records each change.
- Are concurrent changes correctly managed and resolved?
  - **Answer**: Largely yes for test data. The ubuntu workflow uses a concurrency group that cancels in-progress runs for the same reference, so typically only one job updates the persistent database at a time and remaining conflicts would surface as failed pushes and require manual resolution.
- Is data accessible only to intended parties?
  - **Answer**: Since the library is open source, there are no unintended parties.
- Are any subsets of our data being published?
  - **Answer**: Yes, as a proof of concept, CI test result data is committed to the `save_historical_data` branch in the SQLite database `TSF/data_storage/MemoryEfficientTestResultData*.db`, which is publicly accessible via this GitHub repository.
