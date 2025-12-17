---
level: 1.1
normative: false
---

(Note: The guidance, evidence, confidence scoring and checklist sections below are copied from [CodeThink's documentation of TSF](https://codethinklabs.gitlab.io/trustable/trustable/trustable/TA.html). However, the answers to each point in the evidence list and checklist are specific to this project.)

**Guidance**

Constraints on reuse, reconfiguration, modification, and deployment are
specified to enhance the trustability of outputs. To ensure clarity, boundaries
on what the output cannot do - especially where common domain assumptions may
not hold - must be explicitly documented. These constraints are distinct from
misbehaviour mitigations; instead, they define the context within which the
system is designed to operate, including all modes and environmental
considerations. This upfront documentation clarifies intended use, highlights
known limitations, and prevents misinterpretation.

These constraints, categorised into explicit limitations and assumptions of use,
guide both stakeholders and users (integrators, maintainers, operators, and
end-users). They define the intended scope and provide a clear interface for how
upstream and downstream systems can integrate, modify, install, reuse, or
reconfigure to achieve the desired output. The documentation must also specify
the contexts in which the integrity of existing Statements is preserved and
whether reimplementation is required, considering device maintenance
assumptions, including software updates and vulnerability mitigation.

Crucially, these limitations are not unresolved defects from triage decisions
but deliberate exclusions based on design choices. Each omission should be
supported by a clear rationale (linked to relevant Expectations and analyses 
with the appropriate architectural and abstraction levels) to ensure
transparency for future scope expansion and to guide both upstream and
downstream modifications.

To remain effective in practice, constraints must consider user-friendliness in
relation to associated Misbehaviours (TA-MISBEHAVIOURS) and AWIs
(TA-INDICATORS):

- Include mechanisms to prevent misuse (e.g., protecting runtime parameters from
  corruption or unauthorized modification during both development and
  operation), explicitly linking them to relevant Misbehaviours and their
  analyses (as defined in TA-MISBEHAVIOURS).
- Present constraint-related data with emphasis on availability, clarity, and
  transparent communication of defined safe states, along with the mechanisms
  that transition the system into those states, ensuring they are connected to
  the relevant AWIs (as defined in TA-INDICATORS).

Finally, the documentation must establish and promote a clear process for
reporting bugs, issues, and requests.

**Suggested evidence**

- Installation manuals with worked examples
  - **Answer**: See JLS-70.
- Configuration manuals with worked examples
  - **Answer**: See JLS-71.
- Specification documentation with a clearly defined scope
  - **Answer**: See JLS-72. TODO check what a specification documentation actually is and whether this is covered by JLS-72 (the design goals reference)
- User guides detailing limitations in interfaces designed for expandability or modularity
  - **Answer**: #TODO answers. Expandability is not restricted, there is also no user guide about that.
- Documented strategies used by external users to address constraints and work with existing Statements
  - **Answer**: see AOU-10 and AOU-11. TODO search for possible additoinal AOUs to mention here.

**Confidence scoring**

The reliability of these constraints should be assessed based on the absence of
contradictions and obvious pitfalls within the defined Statements.

**Checklist**

- Are the constraints grounded in realistic expectations, backed by real-world
  examples?
  - **Answer**: The constraints originate from S-CORE, the nlohmann/json library and the RFC-8259 standard. As these are all widely used, the constraints are grounded in realistic expectations. TODO think about what constraints are meant here
- Do they effectively guide downstream consumers in expanding upon existing
  Statements?
  - **Answer**: The existing set of AOUs provides effective guidance for consumers.
- Do they provide clear guidance for upstreams on reusing components with
  well-defined claims?
  - **Answer**: # TODO not clear what an upstream is in our case
- Are any Statements explicitly designated as not reusable or adaptable?
  - **Answer**: No, all statements could theoretically be adapted or reused.
- Are there worked examples from downstream or upstream users demonstrating
  these constraints in practice?
  - **Answer**: As the nlohmann/json library is widely used, its constraints (like the installation manual) are regurlarly read and applied and therefore demonstrated.
- Have there been any documented misunderstandings from users, and are these
  visibly resolved?
  - **Answer**: Yes, it is documented that the [brace initialisation](https://json.nlohmann.me/home/faq/) (cf. AOU-06) regularly leads to confusion, cf. [here](https://github.com/nlohmann/json/issues/4898). TODO look for further misunderstandings
- Do external users actively keep up with updates, and are they properly
  notified of any changes?
  - **Answer**: External users of the library are not necessarily automatically notified of an update, and are neither assumed nor required to keep up to date. If the external user forks the github repository, however, then github shows automatically whenever the upstream changes.
