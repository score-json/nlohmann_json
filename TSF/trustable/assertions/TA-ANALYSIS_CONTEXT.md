---
level: 1.1
normative: false
---

**Guidance**

This assertion is satisfied to the extent that test data, and data collected
from monitoring of deployed versions of XYZ, has been analysed, and the results
used to inform the refinement of Expectations and risk analysis.

The extent of the analysis is with sufficient precision to confirm that:

- all Expectations (TA-BEHAVIOURS) are met
- all Misbehaviours (TA-MISBEHAVIOURS) are detected or mitigated
- all advance warning indicators (TA-INDICATORS) are monitored
- failure rates (calculated directly or inferred by statistics) are
  within acceptable tolerance

When tests reveal Misbehaviours missing from our analysis (TA-ANALYSIS), we update our Expectations (TA-BEHAVIOURS, TA-MISBEHAVIOURS).
Guided by confidence evaluations (TA-CONFIDENCE), we refine and repeat the analysis as needed.
Analysis results also inform confidence evaluations, allowing automatic generation through statistical modelling and defining Key Performance Indicators (KPIs) for consistent use across the TSF.

For increased confidence in the analysis specification and results, they should be evaluated in terms of their reliability, relevance, and understandability.

- Reliability: The analysis methods must be verified against both known good and bad data to ensure sufficient detection of false negatives and false positives.
  Accuracy degradation across methods should be tracked and aggregated, making outcomes more easily verifiable and providing visibility into how changes to the system under test or to the analysis mechanisms affect the results.
- Relevance: The results must account for hardware and hardware/software interactions.
  Calibration should address capacity, scalability, response time, latency, and throughput where applicable.
  To further increase confidence in estimated failure rates, the analysis should also cover testing sufficiency (with statistical methods where appropriate), cascading failures including sequencing and concurrency, bug analysis, and comparison against expected results and variability. 
  The analysis should be automated and exercised repeatedly for timely feedback.
- Understandability: Both methods and results should be mapped to other analyses performed on the system (linked to TT_EXPECTATIONS) to ensure alignment with scope, abstraction levels, and partitioning, thereby guiding prioritisation.
  Effectiveness also depends on user-friendliness and presentation (involving semi-formal structured forms, supported by diagrams and figures with clear legends).

To gain increased confidence, test results should be shown to be reproducible. 
Even with non-deterministic software, representative test setups must be ensured to produced reproducible results
within a defined threshold as specified by TT-EXPECTATIONS.
Reproducible test results also supports verification of toolchain updates (together with other measures in TA-FIXES),
by confirming that test results remain unchanged when no changes are intended.

**Evidence**

- Analysis of test data, including thresholds in relation to appropriate statistical properties.
  - **Answer**: 
- Analysis of failures
  - **Answer**: 
- Analysis of spikes and trends
  - **Answer**: 
- Validation of analysis methods used
  - **Answer**: 

**Confidence scoring**

Confidence scoring for TA-ANALYSIS is based on KPIs
that may indicate problems in development, test, or production.

**CHECKLIST**

- What fraction of Expectations are covered by the test data?
  - **Answer**: 
- What fraction of Misbehaviours are covered by the monitored indicator data?
  - **Answer**: 
- How confident are we that the indicator data are accurate and timely?
  - **Answer**: 
- How reliable is the monitoring process?
  - **Answer**: 
- How well does the production data correlate with our test data?
  - **Answer**: 
- Are we publishing our data analysis?
  - **Answer**: 
- Are we comparing and analysing production data vs test?
  - **Answer**: 
- Are our results getting better, or worse?
  - **Answer**: 
- Are we addressing spikes/regressions?
  - **Answer**: 
- Do we have sensible/appropriate target failure rates?
  - **Answer**: 
- Do we need to check the targets?
  - **Answer**: 
- Are we achieving the targets?
  - **Answer**: 
- Are all underlying assumptions and target conditions for the analysis specified?
  - **Answer**: 
- Have the underlying assumptions been verified using known good data?
  - **Answer**: 
- Has the Misbehaviour identification process been verified using known bad data?
  - **Answer**: 
- Are results shown to be reproducible?
  - **Answer**: 

