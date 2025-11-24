---
level: 1.1
normative: false
---

(Note: The guidance, evidence, confidence scoring and checklist sections below are copied from [CodeThink's documentation of TSF](https://codethinklabs.gitlab.io/trustable/trustable/trustable/TA.html). However, the answers to each point in the evidence list and checklist are specific to this project.)

The goal of TA-MISBEHAVIOURS is to force engineers to think critically about their work.
This means understanding and mitigating as many of the situations that cause the
software to deviate from Expected Behaviours as possible. This is not limited to
the contents of the final binary.

**Guidance**

This assertion is satisfied to the extent that we can:

- Show we have identified all of the ways in which nlohmann/json could deviate from its
  Expected Behaviours.
- Demonstrate that mitigations have been specified, verified and validated for
  all Misbehaviours.

Once Expected Behaviours have been identified in TA-BEHAVIOURS, there are at
least four classes of Misbehaviour that can be identified:

- Reachable vulnerable system states that cause deviations from Expected
  Behaviour. These can be identified by stress testing, failures in functional
  and soak testing in TA-BEHAVIOURS and reporting in TA-FIXES. Long run trends
  in both test and production data should also be used to identify these states.
- Potentially unreachable vulnerable system states that could lead to deviations
  from Expected Behaviour. These can be identified using risk/hazard analysis
  techniques including HAZOP, FMEDA and STPA.
- Vulnerabilities in the development process that could lead to deviations from
  Expected Behaviour. This includes those that occur as a result of misuse,
  negligence or malicious intent. These can be identified by incident
  investigation, random sampling of process artifacts and STPA of processes.
- Configurations in integrating projects (including the computer or embedded
  system that is the final product) that could lead to deviations from Expected
  Behaviour.

Identified Misbehaviours must be mitigated. Mitigations include patching,
re-designing components, re-designing architectures, removing components,
testing, static analysis etc. They explicitly _do not_ include the use of AWIs
to return to a known-good state. These are treated specifically and in detail in
TA-INDICATORS.

Mitigations could be verified by:

- Specifying and repeatedly executing false negative tests to confirm that
  functional tests detect known classes of misbehaviour.
- Specifying fault induction tests or stress tests to demonstrate that the
  system continues providing the Expected Behaviour after entering a vulnerable
  system state.
- Performing statistical analysis of test data, including using statistical path
  coverage to demonstrate that the vulnerable system state is never reached.
- Conducting fault injections in development processes to demonstrate that
  vulnerabilities cannot be exploited (knowingly or otherwise) to affect either
  output binaries or our analysis of it, whether this is by manipulating the
  source code, build environment, test cases or any other means.
- Stress testing of assumptions of use. That is, confirming assumptions of use
  are actually consistent with the system and its Expected Behaviours by
  intentionally misinterpreting or liberally interpreting them in a test
  environment. For example, we could consider testing nlohmann/json on different pieces of
  hardware that satisfy its assumptions of use.

Remember that a Misbehaviour is _anything_ that could lead to a deviation from
Expected Behaviour. The specific technologies in and applications of nlohmann/json should
always be considered in addition to the guidance above.

At the core, a faulty design is inherently difficult to mitigate. The first
priority, therefore, is to ensure a fault-tolerant and fault-avoidant design
that minimises fault impact and maximises fault control across all modes and
states. All design considerations should be traceable to analyses at the correct
abstraction level, with appropriate partitioning and scoping, which address
prevalent aspects in complex systems, such as:

- Spatial constraints (e.g., memory corruption)
- Temporal constraints (e.g., timing violations)
- Concurrency constraints (e.g., interference)
- Computational constraints (e.g., precision limits)
- Performance constraints (e.g., latency spikes under load)
- Environmental constraints (e.g., hardware non-determinism)
- Usability constraints (e.g., human interaction errors)

Finally, each new Expectation, whether a required behaviour or a misbehaviour
mitigation, introduces the potential for unexpected emergent properties,
highlighting the importance of simple, understandable designs that build on
established and reusable solutions.

**Suggested evidence**

- List of identified Misbehaviours
  - **Answer**: 
- List of Expectations for mitigations addressing identified Misbehaviours
  - **Answer**: 
- Risk analysis
  - **Answer**: 
- Test analysis, including:
  - False negative tests
    - **Answer**: 
  - Exception handling tests
    - **Answer**: 
  - Stress tests
    - **Answer**: 
  - Soak tests
    - **Answer**: 

**Confidence scoring**

Confidence scoring for TA-MISBEHAVIOURS is based on confidence that
identification and coverage of misbehaviours by tests is complete when
considered against the list of Expectations.

**Checklist**

- How has the list of misbehaviours varied over time?
  - **Answer**: 
- How confident can we be that this list is comprehensive?
  - **Answer**: 
- How well do the misbehaviours map to the expectations?
  - **Answer**: 
- Could some participants have incentives to manipulate information?
  - **Answer**: 
- Could there be whole categories of misbehaviours still undiscovered?
  - **Answer**: 
- Can we identify misbehaviours that have been understood but not specified?
  - **Answer**: 
- Can we identify some new misbehaviours, right now?
  - **Answer**: 
- Is every misbehaviour represented by at least one fault induction test?
  - **Answer**: 
- Are fault inductions used to demonstrate that tests which usually pass can
  and do fail appropriately?
  - **Answer**: 
- Are all the fault induction results actually collected?
  - **Answer**: 
- Are the results evaluated?
  - **Answer**: 
- Do input analysis findings on verifiable tool or component claims and features
identify additional misbehaviours or support existing mitigations?
  - **Answer**: 
