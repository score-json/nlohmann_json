---
level: 1.1
normative: false
---

**Guidance**

Anything that can influence the output of the XYZ project is considered an input.
This includes:

- Software components used to implement specified features and meet defined Expectations
- Software tools, and their outputs, used for design, construction and verification
- Infrastructure that supports development and release processes

All inputs (components, tools, data) and their dependencies (recursively) used to build and verify XYZ releases must be identified and assessed, since they are untrusted by default.

Each input should be evaluated on verifiable merits, regardless of any claims it makes (including adherence to standards or guidance).
Evaluation must include the project's defined Expectations to ensure that inputs meet requirements, and that risks are recorded and addressed appropriately.

For components, we need to consider how their misbehaviour might impact achieving project XYZ's Expectations.
Sources (e.g. bug databases, advisories) for known risks should be identified, their update frequency recorded, and tests defined for detecting them.
These form the inputs to TA-FIXES.

For the tools used to construct and verify XYZ, we need to consider how their misbehaviour could:

- Introduce unintended changes
- Fail to detect Misbehaviours during testing
- Produce misleading data used to design or verify the next iteration

Where any input impacts are identified, consider:

- How serious their impact might be, and whether Expectations or analysis outcomes are affected (severity)
- Whether they are detected by another tool, test, or manual check (detectability)

Confidence in assessing severity and detectability can be supported by analysing development history and practices of each input to evaluate upstream sources (both third-party and first-party) for maintainability and sustainability (including, for example, testability, modularity and configurability) to reduce failure impact and support safe change.

These qualities can be estimated through evidence of software engineering best practice, applied through:

- Processes defining and following design, documentation and review guidelines, carried out manually (advocating simple design, reuse, structured coding constructs, and competent release management)
- Appropriate use of programming languages and their features, supported by tools such as static analysis, with regular improvement of their configurations

For impacts with high severity or low detectability (or both), additional analysis should assess whether existing tests effectively detect Misbehaviours and their impacts.

As a result, for example, any binary inputs without reproducible build steps or clear development history and maintenance processes should be treated as risks and mitigated appropriately.

**Evidence**

- List of components used to build XYZ, including:
  - Whether content is provided as source or binary
    - **Answer**: 
- Record of component assessments:
  - Originating project and version
    - **Answer**: 
  - Date of assessments and identity of assessors
    - **Answer**: 
  - Role of component in XYZ
    - **Answer**: 
  - Sources of bug and risk data
    - **Answer**: 
  - Potential misbehaviours and risks identified and assessed
    - **Answer**: 
- List of tools used to build and verify XYZ
  - **Answer**: 
- Record of tool assessments:
  - Originating project and tool version
    - **Answer**: 
  - Date of assessments and identity of assessors
    - **Answer**: 
  - Role of the tool in XYZ releases
    - **Answer**: 
  - Potential misbehaviours and impacts
    - **Answer**: 
  - Detectability and severity of impacts
    - **Answer**: 
- Tests or measures to address identified impacts
  - **Answer**: 

**Confidence scoring**

Confidence scoring for TA-INPUTS is based on the set of components and tools
identified, how many of (and how often) these have been assessed for their risk
and impact for XYZ, and the sources of risk and issue data identified.

**Checklist**

- Are there components that are not on the list?
  - **Answer**: 
- Are there assessments for all components?
  - **Answer**: 
- Has an assessment been done for the current version of the component?
  - **Answer**: 
- Have sources of bug and/or vulnerability data been identified?
  - **Answer**: 
- Have additional tests and/or Expectations been documented and linked to
  component assessment?
  - **Answer**: 
- Are component tests run when integrating new versions of components?
  - **Answer**: 
- Are there tools that are not on the list?
  - **Answer**: 
- Are there impact assessments for all tools?
  - **Answer**: 
- Have tools with high impact been qualified?
  - **Answer**: 
- Were assessments or reviews done for the current tool versions?
  - **Answer**: 
- Have additional tests and/or Expectations been documented and linked to
  tool assessments?
  - **Answer**: 
- Are tool tests run when integrating new versions of tools?
  - **Answer**: 
- Are tool and component tests included in release preparation?
  - **Answer**: 
- Can patches be applied, and then upstreamed for long-term maintenance?
  - **Answer**: 
- Do all dependencies comply with acceptable licensing terms?
  - **Answer**: 
