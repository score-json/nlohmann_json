---
level: 1.1
normative: false
---

(Note: The guidance, evidence, confidence scoring and checklist sections below are copied from [CodeThink's documentation of TSF](https://codethinklabs.gitlab.io/trustable/trustable/trustable/TA.html). However, the answers to each point in the evidence list and checklist are specific to this project.)

Not all deviations from Expected Behaviour can be associated with a specific
condition. Therefore, we must have a strategy for managing deviations that
arise from unknown system states, process vulnerabilities or configurations.

This is the role of _Advanced Warning Indicators (AWI)_. These are specific
metrics which correlate with deviations from Expected Behaviour and can be
monitored in real time. The system should return to a defined known-good
state when AWIs exceed defined tolerances.

**Guidance**

This assertion is met to the extent that:

- We have identified indicators that are strongly correlated with observed
  deviations from Expected Behaviour in testing and/or production.
- The system returns to a defined known-good state when AWIs exceed
  defined tolerances.
- The mechanism for returning to the known-good state is verified.
- The selection of Advance Warning Indicators is validated against the set of
  possible deviations from Expected behaviour.

Note, the set of possible deviations from Expected behaviour _is not_ the same
as the set of Misbehaviours identified in TA-MISBEHAVIOURS, as it includes
deviations due to unknown causes.

Deviations are easily determined by negating recorded Expectations. Potential
AWIs could be identified using source code analysis, risk analysis or incident
reports. A set of AWIs to be used in production should be identified by
monitoring candidate signals in all tests (functional, soak, stress) and
measuring correlation with deviations.

Telematics, diagnostics, or manual proof testing are of little value without
mitigation. As such, AWI monitoring and mitigation should be automatic,
traceable back to analysis, and formally recorded to ensure information from
previously unidentified misbehaviours is captured in a structured way.

The known-good state should be chosen with regard to the system's intended
consumers and/or context. Canonical examples are mechanisms like reboots,
resets, relaunches and restarts. The mechanism for returning to a known-good
state can be verified using fault induction tests. Incidences of AWIs triggering
a return to the known-good state in either testing or production should be
considered as a Misbehaviour in TA-MISBEHAVIOURS. Relying on AWIs alone is not
an acceptable mitigation strategy. TA-MISBEHAVIOURS and TA-INDICATORS are
treated separately for this reason.

The selection of AWIs can be validated by analysing failure data. For instance,
a high number of instances of deviations with all AWIs in tolerance implies the
set of AWIs is incorrect, or the tolerance is too lax.

**Evidence**

- Risk analyses
  - **Answer**: 
- List of advance warning indicators
  - **Answer**: 
- List of Expectations for monitoring mechanisms
  - **Answer**: 
- List of implemented monitoring mechanisms
  - **Answer**: 
- List of identified misbehaviours without advance warning indicators
  - **Answer**: 
- List of advance warning indicators without implemented monitoring mechanisms
  - **Answer**: 
- Advance warning signal data as time series (see TA-DATA)
  - **Answer**: 

**Confidence scoring**

Confidence scoring for TA-INDICATORS is based on confidence that the list of
indicators is comprehensive / complete, that the indicators are useful, and that
monitoring mechanisms have been implemented to collect the required data.

**Checklist**

- How appropriate/thorough are the analyses that led to the indicators?
  - **Answer**: 
- How confident can we be that the list of indicators is comprehensive?
  - **Answer**: 
- Could there be whole categories of warning indicators still missing?
  - **Answer**: 
- How has the list of advance warning indicators varied over time?
  - **Answer**: 
- How confident are we that the indicators are leading/predictive?
  - **Answer**: 
- Are there misbehaviours that have no advance warning indicators?
  - **Answer**: 
- Can we collect data for all indicators?
  - **Answer**: 
- Are the monitoring mechanisms used included in our Trustable scope?
  - **Answer**: 
- Are there gaps or trends in the data?
  - **Answer**: 
- If there are gaps or trends, are they analysed and addressed?
  - **Answer**: 
- Is the data actually predictive/useful?
  - **Answer**: 
- Are indicators from code, component, tool, or data inspections taken into
consideration? 
  - **Answer**: 
