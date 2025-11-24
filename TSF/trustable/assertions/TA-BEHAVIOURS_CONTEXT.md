---
level: 1.1
normative: false
---

(Note: The guidance, evidence, confidence scoring and checklist sections below are copied from [CodeThink's documentation of TSF](https://codethinklabs.gitlab.io/trustable/trustable/trustable/TA.html). However, the answers to each point in the evidence list and checklist are specific to this project.)

Although it is practically impossible to specify all of the necessary behaviours
and required properties for complex software, we must clearly specify the most
important of these (e.g. where harm could result if given criteria are not met),
and verify that these are correctly provided by the nlohmann/json library.

**Guidance**

This assertion is satisfied to the extent that we have:

- Determined which Behaviours are critical for consumers of nlohmann/json and recorded
  them as Expectations.
- Verified these Behaviours are achieved.

Expectations could be verified by:

- Functional testing for the system.
- Functional soak testing for the system.
- Specifying architecture and verifying its implementation with pre-merge
  integration testing for components.
- Specifying components and verifying their implementation using pre-merge unit
  testing.

The number and combination of the above verification strategies will depend on
the scale of the project. For example, unit testing is more suitable for the
development of a small library than an OS. 
Similarly, the verification strategy must align with the chosen development
methods and be supported by appropriate verification approaches and tools.

Regardless of the chosen strategy, the reasoning behind it must be recorded in a
traceable way, linking breakdown and verification methods to the relevant
reasoning, abstraction levels, and design partitioning (including system
interfaces with users and hardware, or other system boundaries).

Finally, the resulting system must be validated, with the foundation of
validation being a working system that has appropriately considered calibration
targets such as capacity, scalability, response time, latency, and throughput,
where applicable.
Without this, specification and verification efforts cannot be considered
sufficient.

**Evidence**

- List of Expectations
  - **Answer**: 
- Argument of sufficiency for break-down of expected behaviour for all 
  Expectations
  - **Answer**: 
- Validation and verification of expected behaviour
  - **Answer**: 


**Confidence scoring**

Confidence scoring for TA-BEHAVIOURS is based on our confidence that the list of
Expectations is accurate and complete, that Expectations are verified by tests,
and that the resulting system and tests are validated by appropriate strategies.

**Checklist**

- How has the list of Expectations varied over time?
  - **Answer**: The list of expectations is taken from [here](https://eclipse-score.github.io/score/main/modules/baselibs/json/docs/requirements/index.html), whose development can be retraced using git.
- How confident can we be that this list is comprehensive?
  - **Answer**: The list of expectations has been collected amongst the stakeholders in S-CORE, so that we are very confident that the list is comprehensive. The expectation to serialize user data into JSON format.
- Could some participants have incentives to manipulate information?
  - **Answer**: We can not imagine any reason.
- Could there be whole categories of Expectations still undiscovered?
  - **Answer**: It is unlikely, but the parsing of CBOR could become relevant at some time.
- Can we identify Expectations that have been understood but not specified?
  - **Answer**: There are currently now Expectations that have been understood but not specified.
- Can we identify some new Expectations, right now?
  - **Answer**: No, we don't know of any new expectations we could identify right now.
- How confident can we be that this list covers all critical requirements?
  - **Answer**: We can not think of any more critical requirement of a JSON parser in the sense of RFC8259 than to parse JSON data in the sense of RFC8259.
- How comprehensive is the list of tests?
  - **Answer**: Currently, the branch coverage is 93.865% and the line coverage is 99.186%, cf. JLS-27.
- Is every Expectation covered by at least one implemented test?
  - **Answer**: Yes, both of the expectations are covered by at least one implemented test.
- Are there any Expectations where we believe more coverage would help?
  - **Answer**: No.
- How do dependencies affect Expectations, and are their properties verifiable?
  - **Answer**: The library nlohmann/json does not have external dependencies, so that there are in particular none that affect Expectations.
- Are input analysis findings from components, tools, and data considered in relation to Expectations?
  - **Answer**: Not that we know of.
