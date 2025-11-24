---
level: 1.1
normative: false
---

(Note: The guidance, evidence, confidence scoring and checklist sections below are copied from [CodeThink's documentation of TSF](https://codethinklabs.gitlab.io/trustable/trustable/trustable/TA.html). However, the answers to each point in the evidence list and checklist are specific to this project.)

**Guidance**

This assertion is satisfied to the extent that we have traced and captured
source code for nlohmann/json and all of its dependencies (including transitive
dependencies, all the way down), and for all of the tools used to construct
nlohmann/json from source, and have mirrored versions of these inputs under our control.
Any associated data and documentation dependencies must also be considered.

'Mirrored' in this context means that we have a version of the upstream project
that we keep up-to-date with additions and changes to the upstream project,
but which is protected from changes that would delete the project, or remove
parts of its history.

Clearly this is not possible for components or tools (or data) that are provided only in
binary form, or accessed via online services - in these circumstances we can
only assess confidence based on attestations made by the suppliers, and on our
experience with the suppliers' people and processes.

Keep in mind that even if repositories with source code for a particular
component or tool are available, not all of it may be stored in Git as
plaintext. A deeper analysis is required in TA-INPUTS to assess the impact of any
binaries present within the repositories of the components and tools used.

**Evidence**

- list of all nlohmann/json components including
  - URL of mirrored projects in controlled environment
    - **Answer**: 
  - URL of upstream projects
    - **Answer**: 
- successful build of nlohmann/json from source
  - without access to external source projects
    - **Answer**: 
  - without access to cached data
    - **Answer**: 
- update logs for mirrored projects
  - **Answer**: 
- mirrors reject history rewrites
  - **Answer**: 
- mirroring is configured via infrastructure under direct control
  - **Answer**: 

**Confidence scoring**

Confidence scoring for TA-SUPPLY_CHAIN is based on confidence that all inputs and
dependencies are identified and mirrored, and that mirrored projects cannot be
compromised.

**Checklist**

- Could there be other components, missed from the list?
  - **Answer**: 
- Does the list include all toolchain components?
  - **Answer**: 
- Does the toolchain include a bootstrap?
  - **Answer**: 
- Could the content of a mirrored project be compromised by an upstream change?
  - **Answer**: 
- Are mirrored projects up to date with the upstream project?
  - **Answer**: 
- Are mirrored projects based on the correct upstream?
  - **Answer**: 
