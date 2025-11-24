---
level: 1.1
normative: false
---

(Note: The guidance, evidence, confidence scoring and checklist sections below are copied from [CodeThink's documentation of TSF](https://codethinklabs.gitlab.io/trustable/trustable/trustable/TA.html). However, the answers to each point in the evidence list and checklist are specific to this project.)

**Guidance**

This assertion is satisfied to the extent that we have identified, triaged, and applied fixes or mitigations to faults in nlohmann/json, as well as to bugs and publicly disclosed vulnerabilities identified in upstream dependencies.

Confidence can be improved by assessing known faults, bugs, and vulnerabilities to establish their relevance and impact for nlohmann/json.
An important aspect is documenting how issues are discovered and tracked, including identifying additional Misbehaviours (TA-MISBEHAVIOURS) that may require immediate mitigation measures (including recalls), and how such issues are communicated to users.

In principle, this analysis should include not only the code in nlohmann/json but also its dependencies (all the way down) and the tools and data used to construct the release.
In practice, however, the cost/benefit of this work must be weighed against:

- the volume and quality of available bug and vulnerability reports
- the likelihood that our build, configuration, or use case is actually affected

The triage process must be documented, reviewed, and evidenced as sufficient and consistently followed.
Documentation must make clear how prioritisation, assignment, and rejection (e.g., for duplicates) are handled, and how mitigations are tracked to completion in a timely manner appropriate to the project's claims and the issues discovered.

Field incidents are a key source of high-priority Misbehaviours.
These require additional rigour to ensure appropriate and timely responses.
For every iteration and associated change, related issue resolutions must be documented with their impact (e.g., whether new Misbehaviours were found or parts of the analysis had to be redone) and linked to the specific change, ensuring visible traceability.
This information must remain available to support decision traceability throughout the project's lifetime (as considered in TA-DATA).

As part of ongoing monitoring, the rate of incoming, resolved, and rejected issues across the project and its dependencies should be tracked for trends and anomalies, to identify shifts and to detect if a source of information is lost.

**Evidence**

- List of known bugs fixed since last release
  - **Answer**: Provided in JLS-29
- List of outstanding bugs still not fixed, with triage/prioritisation based
  on severity/relevance/impact
  - **Answer**: Provided in JLS-28 and JLS-11
- List of known vulnerabilities fixed since last release
  - **Answer**: Provided in JLS-29
- List of outstanding known vulnerabilities still not fixed, with triage/prioritisation based
  on severity/relevance/impact
  - **Answer**: Provided in JLS-30, JLS-33 and AOU-29
- List of nlohmann/json component versions, showing where a newer version exists upstream
  - **Answer**: Not relevant since nlohmann/json has no external components, as stated in JLS-34
- List of component version updates since last release
  - **Answer**: Not relevant as nlohmann/json has no external components, as stated in JLS-34
- List of fixes applied to developed code since last release
  - **Answer**: Provided in JLS-29
- List of fixes for developed code that are outstanding, not applied yet
  - **Answer**: Provided in JLS-11
- List of nlohmann/json faults outstanding (O)
  - **Answer**: Provided in JLS-11
- List of nlohmann/json faults fixed since last release (F)
  - **Answer**: Provided in JLS-29
- List of nlohmann/json faults mitigated since last release (M)
  - **Answer**: Provided in JLS-29

**Confidence scoring**

Confidence scoring for TA-FIXES can be based on

- some function of [O, F, M] for nlohmann/json
- number of outstanding relevant bugs from components
- bug triage results, accounting for undiscovered bugs
- number of outstanding known vulnerabilities
- triage results of publicly disclosed vulnerabilities, accounting for undiscovered bugs and vulnerabilities
- confidence that known fixes have been applied
- confidence that known mitigations have been applied
- previous confidence score for TA-FIXES

Each iteration, we should improve the algorithm based on measurements

**Checklist**

- How many faults have we identified in nlohmann/json?
  - **Answer**: 58, but none are relevant for S-CORE's use case of the library (see JLS-11).
- How many unknown faults remain to be found, based on the number that have
  been processed so far?
  - **Answer**: It is unlikely that there are unknown faults relevant to S-CORE.
- Is there any possibility that people could be motivated to manipulate the
  lists (e.g. bug bonus or pressure to close).
  - **Answer**: It is unlikely that people would be motivated to manipulate the lists in nlohmann/json. The nlohmann/json project has no bug bounties, and since it is open source, third party individuals suggest fixes with no pressure/incentive to manipulate unfixed issues.
- How many faults may be unrecorded (or incorrectly closed, or downplayed)?
  - **Answer**: Few or none, considering the wide use of the nlohmann/json library (see JLS-05).
- How do we collect lists of bugs and known vulnerabilities from components?
  - **Answer**: We pull the list from the issues reported to nlohmann/json labelled as bug and are currently open or were opened since the last release. This list is then stored using GitHub, thereby enabling a traceability of the list.
- How (and how often) do we check these lists for relevant bugs and known vulnerabilities?
  - **Answer**: Whenever we generate the documentation, the list is pulled. If there is an issue previously unrecorded, then the maintainer is encouraged by the change of the trustable score to check the relevance of the issue.
- How confident can we be that the lists are honestly maintained?
  - **Answer**: Very confident, since the authors of the issues in the list mainly comprise independent downstream users.
- Could some participants have incentives to manipulate information?
  - **Answer**: No such incentives have been identified.
- How confident are we that the lists are comprehensive?
  - **Answer**: Fairly confident, considering the wide use of the library (see JLS-05) and that downstream users are likely to report discovered bugs.
- Could there be whole categories of bugs/vulnerabilities still undiscovered?
  - **Answer**: Unlikely, considering the wide use of the library (see JLS-05) and that downstream users are likely to report discovered bugs.
- How effective is our triage/prioritisation?
  - **Answer**: There is no development of the json library within S-CORE, and therefore no triage/prioritisation. Any identified bugs/vulnerabilities are reported to nlohmann/json. Within nlohmann/json, no formal triage process has been identified. Nevertheless, reported bugs and vulnerabilities seem to be handled in a timely manner.
- How many components have never been updated?
  - **Answer**: None, the nlohmann/json library consists of a single header file, which the only component. This component is up to date.
- How confident are we that we could update them?
  - **Answer**: Within nlohmann/json, there are no external components to update. Within S-CORE, if a new version of the nlohmann/json library is released, we are very confident that we can update to that version. (See the update process in TSF/README.md)
- How confident are we that outstanding fixes do not impact our Expectations?
  - **Answer**: No outstanding fixes that impact the Expectations have been identified.
- How confident are we that outstanding fixes do not address Misbehaviours?
  - **Answer**: Very confident, as no Misbehaviours have been identified.
