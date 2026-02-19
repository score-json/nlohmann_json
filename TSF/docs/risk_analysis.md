## Risk Analysis for nlohmann/json 3.12.0 within eclipse-score/nlohmann_json

This document provides a **risk analysis** for the **eclipse-score/nlohmann_json** repository following the risk analysis approach of the Trustable Software Framework (TSF) \[[RAFIA: Risk Analysis](https://pages.eclipse.dev/eclipse/tsf/tsf/extensions/rafia/risk-analysis.html)\].

## 0. Methodology (RAFIA / STPA) – What is being done and why

Risk Analysis objectives (summarised from the Codethink guidance) are:

- **Hazard analysis**
  - Describe a *system/subsystem* that incorporates the software.
  - Identify *Losses* (unacceptable outcomes) and *Hazards* (system-level conditions leading to losses).
  - Specify a *control structure* (controllers, controlled processes, control actions, feedback).
  - Identify *Unsafe Control Actions (UCAs)* that may result in hazards.
  - Identify *Causal Scenarios* that can lead to UCAs or hazards.
  - Devise *Constraints* that must hold to avoid hazards/UCAs/scenarios.
- **Traceability**
  - Map analysis outcomes into the TSF model of Statements: *Expectations*, *Assertions*, *Evidence*.
  - Maintain forward/backward links so that changes to any statement trigger re-evaluation of related analysis links.
- **Risk evaluation**
  - Evaluate relative importance of hazards/misbehaviours using at least **severity** and **likelihood**, and optionally **controllability** and **exposure/demand**, to support prioritisation and cost/benefit decisions \[[RAFIA: Risk Analysis](https://pages.eclipse.dev/eclipse/tsf/tsf/extensions/rafia/risk-analysis.html)\].

### How this is instantiated for this repository

This repository already contains a rich TSF statement graph that captures:

- the **expected behaviours** (`JLEX-01`, `JLEX-02`) and their supporting evidence (`WFJ-*`, `PJD-*`, `NJF-*`, `NPF-*`, `TIJ-*`), and
- the process expectations around tests, fixes, inputs, constraints, and analysis (`TA-TESTS`, `TA-FIXES`, `TA-INPUTS`, `TA-CONSTRAINTS`, `TA-ANALYSIS`, …).

### STPA procedure and schema conformance

This document follows the RAFIA STPA procedure at the level of intent and outputs (Losses → Hazards → Control Structure → UCAs → Scenarios → Constraints → Misbehaviours), as described in the TSF extensions:

- STPA procedure: \[[RAFIA STPA Procedure](https://pages.eclipse.dev/eclipse/tsf/tsf/extensions/stpa/procedure.html)\]
- STPA workbook schema (tables/columns): \[[STPA results schema](https://pages.eclipse.dev/eclipse/tsf/tsf/extensions/stpa/schema.html)\]

---

## 1. Scope and System Context

The system boundary, environment, and boundary-crossing interactions assumed for this scope are summarised in the control structure diagram in Section 3.0.

### 1.1 Software Under Analysis

The software under analysis is the **header-only C++ JSON library `nlohmann/json` (v3.12.0)**, with:

- **Implementation**
  - primary include `include/nlohmann/json.hpp` (and internal headers under `include/nlohmann/detail/**`)
  - optional amalgamated single-include header `single_include/nlohmann/json.hpp`
  - C++11, no external code dependencies
- **Purpose**
  - provide JSON parsing and validation per **RFC 8259**
- **Evidence**
  - captured extensively in `WFJ-*`, `TIJ-*`, `NJF-*`, `NPF-*`, and `PJD-*` statements, which are connected in the trustable graph to the expectations `JLEX-01` and `JLEX-02`.

In practical terms, this means the “safety envelope” of the component is defined by the combination of:

- the semantic scope of RFC 8259 JSON (what inputs are considered valid JSON), and
- the repository’s explicit expectations (`JLEX-01`, `JLEX-02`) and their evidence families.

### 1.2 Integration Context (as documented by TSF expectations)

This repository’s TSF Expectations explicitly scope the intended integration context to:

- JSON validation (`JLEX-01`, referencing the S-CORE JSON Validation requirement), and
- JSON deserialization (`JLEX-02`, referencing the S-CORE JSON Deserialization requirement).

In the remainder of this document, “S-CORE” is used as a **target-system / integrator label** for expressing system-level Losses and Hazards in the STPA sense. This repository itself documents the `nlohmann/json` component and its TSF statement graph.

The TSF graph shows this as:

- `TT-EXPECTATIONS` → `TA-BEHAVIOURS` → `JLEX-01`, `JLEX-02`
- `TA-INPUTS` → multiple `JLS-*` (e.g. `JLS-34`, `JLS-48`, `JLS-49`, `JLS-50`), describing properties of inputs, dependencies and environment.

The library **does not control hardware directly**. Misbehaviours affect S-CORE only **via incorrect JSON validation or parsing**, influencing higher-level functions.

Because this is a *library component*, we express risks at the S-CORE system level (e.g., “S-CORE accepts ill-formed JSON”), and we treat the library as a contributing factor through its API behaviour and error signalling. This matches the RAFIA/STPA guidance to analyse the software in the context of a system/subsystem, rather than as an isolated artifact \[[RAFIA: Risk Analysis](https://pages.eclipse.dev/eclipse/tsf/tsf/extensions/rafia/risk-analysis.html)\].

### 1.3 Assumptions of Use and Constraints

The nodes:

- `TA-CONSTRAINTS` → `AOU-01..AOU-30`
- `TA-INPUTS` → `JLS-04`, `JLS-34`, `JLS-47`, `JLS-48`, `JLS-49`, `JLS-50`

capture key **Assumptions of Use (AOU-*)** and **constraints** for integration, including:

- S-CORE code must check `accept`/`parse` results and handle exceptions correctly.
- Input encoding and error signalling are managed at the integration boundary (notably UTF-8 input per `AOU-05`, and proper exception handling per `AOU-04` and `AOU-07`).
- This analysis assumes integrators do not depend on unspecified or undocumented behaviours.

This Risk Analysis is valid under these assumptions and constraints.

#### AOU statements directly relevant to this analysis (normative)

The following Assumptions of Use are explicitly stated in this TSF tree and are directly relevant to risk analysis of JSON parsing/validation:

- **`AOU-04`**: the integrator shall ensure that exceptions are properly handled or turned off when using the library.
- **`AOU-05`**: the integrator shall ensure input is UTF-8 (RFC 8259) and handle exceptions for other string formats.
- **`AOU-07`**: expected parsing errors for invalid JSON (default parameters) shall be detected and handled properly.
- **`AOU-20`**: keys within an object shall be unique whenever an object is parsed.
- **`AOU-22`**: numbers shall be written in base 10; exceptions/misbehaviours for other bases shall be handled/mitigated.
- **`AOU-23`**: data shall be complete and error-free whenever transmitted to the component.
- **`AOU-27`**: release management / update concepts in `TSF/README.md` shall be followed when changes are done.
- **`AOU-28`**: known open bugs in upstream `nlohmann/json` shall be regularly reviewed for impact.
- **`AOU-29`**: the GitHub security tab shall be checked regularly and outstanding CVEs analysed and fixed/dismissed.

These AOU statements are treated as **controller/environment constraints** in the sense that they constrain how the integrator/environment must behave so that the component can be used safely for the intended scope.

---

## 2. Purpose of the analysis

### 2.1 Losses (Unacceptable Outcomes)

Although `nlohmann/json` is a library, its misbehaviour can contribute to unacceptable outcomes in S-CORE applications.

To stay consistent with RAFIA, we define losses as **unacceptable outcomes for stakeholders**, not as “bugs”. For a parsing/validation library, the primary stakeholder impact is through *incorrect decisions, corrupted configuration/data, or loss of availability* in the integrating system. Losses are deliberately phrased at S-CORE level, because S-CORE is the system that ultimately experiences the unacceptable outcome.

### Rationale for the chosen losses

The loss set (L1–L6) is intentionally small and orthogonal:

- **Correctness / decision impact** (L1) covers downstream consequences when S-CORE acts on a parsed value that is wrong for the intended meaning.
- **Input acceptance / rejection integrity** (L2) captures the baseline that syntactically ill-formed inputs must be rejected (i.e., not treated as valid JSON).
- **Compliance exposure** (L3) is included because this component is commonly integrated into regulated or contract-driven systems, where correct JSON handling can be part of auditability and traceability obligations
- **Availability** (L4) is included because parsing and validation failures can become denial-of-service vectors or cause systemic instability.
- **Silent data corruption** (L5) captures a distinct failure mode from availability: the system continues operating but with undetected corruption (e.g., configuration or logs), which can be more dangerous than explicit failure.
- **Security / trust compromise** (L6) is included because this component may process untrusted input, and exploitable parser weaknesses or unpatched known vulnerabilities (e.g., CVEs) can lead to compromise in an integrating system even when functional behaviour is otherwise well specified.

| Loss Id | Loss description | Loss category |
|---|---|---|
| L1 | Safety-relevant or correctness-critical S-CORE decisions are based on incorrectly parsed JSON data. | Safety |
| L2 | S-CORE fails to reject syntactically ill-formed JSON inputs that must be rejected. | User |
| L3 | S-CORE violates contractual, regulatory, or audit requirements that depend on correct JSON validation/parsing (e.g., configuration integrity, trustworthy logs). | Commercial |
| L4 | S-CORE services become unavailable or unstable due to parser exceptions, crashes or hangs. | User |
| L5 | Integrity of JSON-based logs or configuration data is compromised by silently incorrect parsing. | Commercial |
| L6 | Security compromise due to exploitation of parsing/processing weaknesses or unpatched known vulnerabilities. | Security |

---

### 2.2 Hazards (System-Level Conditions)

Using the Losses, we define **Hazards (H\*)** at S-CORE level:

Hazards are not “root causes” and not “bugs”; they are **system-level conditions** that can lead to losses if they occur. Here, hazards are defined as conditions about *what S-CORE accepts, rejects, produces, or fails to handle*, because those are the conditions that create stakeholder-relevant losses.

| Hazard Id | Hazard description | Link to loss(es) | Notes |
|---|---|---|---|
| H1 | S-CORE accepts JSON inputs that are not syntactically well-formed per RFC 8259. | L1; L2; L3; L5 |  |
| H2 | S-CORE rejects syntactically well-formed JSON inputs that should be accepted in the defined domain. | L1; L4 |  |
| H3 | S-CORE obtains a parsed representation that is semantically inconsistent with the original JSON text. | L1; L3; L5 |  |
| H4 | S-CORE encounters unhandled exceptions or hangs during JSON parsing/validation operations. | L4 |  |
| H5 | S-CORE misinterprets parser outcomes due to ambiguous or undocumented behaviour of the library. | L1; L2; L3; L5 |  |
| H6 | S-CORE experiences resource exhaustion (CPU/memory/time) while processing JSON inputs, impacting availability or deadlines. | L4 |  |
| H7 | Upstream vulnerabilities or relevant open bugs are not tracked/triaged, so known issues remain present in the integrated component. | L6; L4 |  |

---

### 2.3 System-level Constraints

In RAFIA/STPA, constraints are “statements that must be true” to avoid a hazard, UCA, or causal scenario \[[RAFIA: Risk Analysis](https://pages.eclipse.dev/eclipse/tsf/tsf/extensions/rafia/risk-analysis.html)\]. In TSF terms, these constraints are captured as (or mapped onto existing) **Items**, and are supported by **Evidence**.

| Constraint Id | Description | Constraint Type | Link to Constraint(s) | Link to Hazard(s) | Links to UCA | Links to CS | Links to TSF |
|---|---|---|---|---|---|---|---|
| C1 | `basic_json::accept` correctly distinguishes RFC 8259 well-formed JSON from ill-formed JSON for all inputs within the defined scope/integration context. | CFC |  | H1; H2 | UCA1; UCA2 | CS1.1; CS1.2 | JLEX-01 |
| C2 | `basic_json::parse` returns a correct representation for well-formed JSON or signals failure clearly (exception) under the defined scope/integration context. | CFC |  | H2; H3; H4; H5 | UCA3; UCA4; UCA5 | CS1.3; CS1.4; CS1.5; CS2.2 | JLEX-02 |
| C3 | For ill-formed JSON, parsing does not silently produce a misleading `basic_json` value; failure is signalled. | CFC |  | H1; H5 | UCA3 | CS1.1 | JLS-24 |
| C4 | Parsing/validation completes within acceptable resource/time bounds for the integration context, or the integration specifies explicit budgets/limits. | SLC |  | H4; H6 |  |  |  |
| C5 | A safe dependency state is maintained such that known relevant upstream issues/CVEs do not remain present beyond acceptable limits. | SLC |  | H7 |  |  | JLS-11; AOU-27; AOU-28; AOU-29 |
| C6 | All feedback channels at the integration boundary (validation results and exceptions/error signalling) are handled and interpreted correctly. | CSC |  | H4; H5 | UCA5 | CS1.5; CS4.1; CS4.2 | AOU-04; AOU-07 |
| C7 | Input encoding satisfies RFC 8259 (UTF-8) or violations are handled explicitly at the boundary. | CSC |  | H4; H5 |  | CS4.3 | AOU-05 |
| C8 | Object keys are unique when objects are parsed (or ambiguity is mitigated at integration level). | CSC |  | H5 |  | CS4.4 | AOU-20 |
| C9 | Numbers are base-10 as required by JSON, or non-decimal representations are handled/mitigated. | CSC |  | H4; H5 |  | CS4.5 | AOU-22 |
| C10 | Data is complete and error-free at the component boundary (or boundary corruption is detected/handled). | CSC |  | H5 |  | CS4.6 | AOU-23 |
| C11 | Governance workflow detects/triages/mitigates upstream drift and advisories for the integrated dependency. | CSC | C5 | H7 | UCA6; UCA7; UCA8; UCA9 | CS3.1; CS3.2; CS3.3 | AOU-27; AOU-28; AOU-29; JLS-11 |

---

## 3. Control structure

Here, a control structure is defined, which is intentionally minimal and models two control loops:

- **CL1 (Functional validation/parsing)**: S-CORE calls `accept`/`parse` and reacts to Boolean results and exceptions.
- **CL2 (Governance)**: periodic upstream issue/CVE review and update decisions, because **H7** is in scope (anchored by `AOU-27..29`).

### 3.0 Control structure diagram (scope + interactions)

![STPA control structure and scope boundary](STPA_diagram_nlohmann.png)

This diagram is used both to define the **scope of analysis** (system boundary and environment) and to describe the **control structure** (elements and interactions). Control actions are shown as solid arrows, feedback as dashed arrows, and boundary/other interactions as a distinct dashed style (see legend). The diagram is a functional abstraction (not a physical or executable model) and does not assume that control actions or feedback are always delivered as intended.

### 3.1 Elements 

| Element Id | Element | Role | Responsibility (short) |
|---|---|---|---|
| E1 | S-CORE JSON caller | Controller | Calls `accept`/`parse`, interprets results, handles errors |
| E2 | `nlohmann/json` service | Controlled Process | Validates/parses input and returns Boolean/value or throws |
| E3 | Integration governance process | Controller | Reviews upstream issues/CVEs; decides mitigation/update |
| E4 | Dependency state | Controlled Process | Current version + known upstream issues/CVEs affecting it |

### 3.2 Interactions (control actions and feedback)

| Interaction Id | Kind | Provider → Receiver | Meaning (short) |
|---|---|---|---|
| I1 | CA | E1 → E2 | Call `basic_json::accept` on input text |
| I2 | FB | E2 → E1 | Return Boolean `accept` result |
| I3 | CA | E1 → E2 | Call `basic_json::parse` on input text |
| I4 | FB | E2 → E1 | Return parsed value or throw exception |
| I5 | CA | E3 → E4 | Perform upstream triage/update decision |
| I6 | FB | E4 → E3 | Provide upstream status/impact signals |

### 3.3 Control loops and step references (used by Scenarios)

| Loop | CL ref | Step meaning | Interaction(s) |
|---|---|---|---|
| CL1 | CL1-1 | Validation action (`accept`) | I1 |
| CL1 | CL1-2 | Validation feedback | I2 |
| CL1 | CL1-3 | Parsing action (`parse`) | I3 |
| CL1 | CL1-4 | Parsing feedback + handling at boundary | I4 |
| CL2 | CL2-1 | Governance action (triage/update decision) | I5 |
| CL2 | CL2-2 | Governance feedback (status/impact signals) | I6 |

---

## 4. Unsafe Control Actions (UCAs)

Using the control structure, we identify **Unsafe Control Actions (UCA\*)**:

A UCA is an interaction between a controller and a controlled process that can lead to a hazard. For this library-centric control structure, UCAs correspond to “incorrect accept/parse outcome” and “incorrect error signalling”.

Per the RAFIA STPA procedure, the normative Step 4 record is the **CA-Analysis** table (UCAType × context × control action), from which the **UCA** table is derived.

### 4.1 UCA-Contexts

| Context Id | Unsafe Context | Notes |
|---|---|---|
| UCX1 | WHEN `accept` is used as a gating signal for whether untrusted input is treated as JSON (and the caller acts on that decision) | Covers both acceptance of ill-formed input and rejection of well-formed input as system-level unsafe outcomes. |
| UCX2 | WHEN `parse` is used to parse untrusted input and the parsed value is used for subsequent decisions or execution paths | Focus is on correctness of the parsed representation relative to the input text. |
| UCX3 | WHEN `parse` is expected to fail safely and predictably for invalid input and to complete within practical constraints for valid input | Includes exception signalling, hang/non-termination, and ambiguity at the boundary. |
| UCX4 | WHEN new upstream issues/advisories apply to the deployed dependency state and governance is responsible for triage and timely mitigations/updates | Includes decision quality, timeliness, and required evaluation steps. |

### 4.2 CA-Analysis

The RAFIA STPA procedure requires a CA-Analysis table keyed by control actions (here: **I1**, **I3**, **I5**) and including a full set of rows for each defined **UCAType** (NP, PR, ML, MM, DS, DL, TE, TL, SO) for each applicable **UCA Context**.

| CA Analysis ID | CA Id | UCA Type | UCA Context | Analysis Result | Hazard(s) | Justification |
|---|---|---|---|---|---|---|
| CAA-I1-UCX1-NP | I1 | NP | UCX1 | Safe |  | Not calling `accept` does not introduce a new hazard in this control structure: `parse` remains the authoritative validation/parse step and is analysed separately (I3). |
| CAA-I1-UCX1-PR-UCA1 | I1 | PR | UCX1 | UCA | H1; H5 | If `accept` returns `true` for ill-formed JSON, S-CORE may treat ill-formed input as valid and proceed (UCA1). |
| CAA-I1-UCX1-PR-UCA2 | I1 | PR | UCX1 | UCA | H2 | If `accept` returns `false` for well-formed JSON, S-CORE may reject valid input that should be accepted (UCA2). |
| CAA-I1-UCX1-ML | I1 | ML | UCX1 | N/A |  | Magnitude of a control action does not apply to a discrete function call in this abstraction; unsafe outcomes are covered under PR/TL. |
| CAA-I1-UCX1-MM | I1 | MM | UCX1 | N/A |  | Magnitude of a control action does not apply to a discrete function call in this abstraction; unsafe outcomes are covered under PR/TL. |
| CAA-I1-UCX1-DS | I1 | DS | UCX1 | N/A |  | Duration (too short) is not meaningful for this discrete call; any timing-related unsafe outcome is captured under TE/TL. |
| CAA-I1-UCX1-DL | I1 | DL | UCX1 | N/A |  | Duration (too long) is captured as “too late” (TL) for this discrete call outcome at the boundary. |
| CAA-I1-UCX1-TE | I1 | TE | UCX1 | N/A |  | “Too early” does not apply: `accept` is invoked explicitly by the caller, and there is no earlier unsafe timing context defined for UCX1. |
| CAA-I1-UCX1-TL | I1 | TL | UCX1 | Safe |  | If `accept` is slow, the system-level effect is availability impact rather than an unsafe acceptance decision; availability for valid input is analysed under I3 timing/termination (UCA4) in UCX3. |
| CAA-I1-UCX1-SO | I1 | SO | UCX1 | N/A |  | Sequence/order does not apply to this single, synchronous call in isolation. Concurrency/order hazards are analysed at the `parse` boundary where practical impact is observed (UCX3). |
| CAA-I3-UCX2-NP | I3 | NP | UCX2 | Safe |  | If `parse` is not invoked then no parsed value is produced and this specific hazard mechanism (semantic mismatch) cannot occur. |
| CAA-I3-UCX2-PR | I3 | PR | UCX2 | UCA | H3; H5 | If `parse` returns a value inconsistent with the input text then the system may act on an incorrect representation (UCA3). |
| CAA-I3-UCX2-ML | I3 | ML | UCX2 | N/A |  | Magnitude categories do not apply to this abstraction of `parse` as a discrete call; unsafe outcomes are captured under PR/TL. |
| CAA-I3-UCX2-MM | I3 | MM | UCX2 | N/A |  | Magnitude categories do not apply to this abstraction of `parse` as a discrete call; unsafe outcomes are captured under PR/TL. |
| CAA-I3-UCX2-DS | I3 | DS | UCX2 | N/A |  | Duration (too short) is not meaningful for this discrete call; incorrect early termination would manifest as an error/exception covered under UCX3. |
| CAA-I3-UCX2-DL | I3 | DL | UCX2 | N/A |  | Duration (too long) is captured as “too late” (TL) for completion within practical constraints. |
| CAA-I3-UCX2-TE | I3 | TE | UCX2 | N/A |  | “Too early” does not apply: `parse` is invoked explicitly by the caller in response to system needs. |
| CAA-I3-UCX2-TL | I3 | TL | UCX2 | Safe |  | Timing issues for `parse` are analysed in UCX3 because the safety-relevant mechanism is failure to complete or signal errors safely, not early/late correctness mismatch. |
| CAA-I3-UCX2-SO | I3 | SO | UCX2 | N/A |  | Sequence/order is not applicable to a single `parse` call in isolation; ordering-related problems are treated as boundary error-handling/concurrency in UCX3. |
| CAA-I3-UCX3-NP | I3 | NP | UCX3 | Safe |  | If `parse` is not invoked, the error-signalling and termination issues in UCX3 do not arise for this interaction. |
| CAA-I3-UCX3-PR | I3 | PR | UCX3 | UCA | H4; H5 | If errors are signalled ambiguously (or in a way the caller can misinterpret), boundary handling can fail (UCA5). |
| CAA-I3-UCX3-ML | I3 | ML | UCX3 | N/A |  | Magnitude is not meaningful for this discrete call abstraction. |
| CAA-I3-UCX3-MM | I3 | MM | UCX3 | N/A |  | Magnitude is not meaningful for this discrete call abstraction. |
| CAA-I3-UCX3-DS | I3 | DS | UCX3 | N/A |  | Duration (too short) is not meaningful for error signalling; premature termination manifests as exception/failed parse which is already covered by PR/Safe outcomes. |
| CAA-I3-UCX3-DL | I3 | DL | UCX3 | Safe |  | “Too long” is treated as “too late” (TL) for this discrete call in this analysis; the unsafe outcome is recorded under TL (UCA4). |
| CAA-I3-UCX3-TE | I3 | TE | UCX3 | N/A |  | “Too early” does not apply for this synchronous call abstraction. |
| CAA-I3-UCX3-TL | I3 | TL | UCX3 | UCA | H2; H4 | “Too late” completion (effectively non-termination or excessive delay) makes the interaction unsafe under practical constraints (UCA4). |
| CAA-I3-UCX3-SO | I3 | SO | UCX3 | Safe |  | The library call is synchronous; sequence/order issues primarily arise in the caller’s concurrency model. This analysis assumes the caller does not treat results from one thread/context as belonging to another; otherwise additional UCAs and hazards should be added. |
| CAA-I5-UCX4-NP | I5 | NP | UCX4 | UCA | H7 | Not performing required triage/review can leave known issues unmitigated (UCA6). |
| CAA-I5-UCX4-PR | I5 | PR | UCX4 | UCA | H7 | Performing triage but dismissing an applicable advisory/issue is unsafe (UCA7). |
| CAA-I5-UCX4-ML | I5 | ML | UCX4 | N/A |  | Magnitude is not meaningful for this governance decision in this abstraction. |
| CAA-I5-UCX4-MM | I5 | MM | UCX4 | N/A |  | Magnitude is not meaningful for this governance decision in this abstraction. |
| CAA-I5-UCX4-DS | I5 | DS | UCX4 | N/A |  | Duration (too short) is not meaningful for this discrete decision abstraction; relevant issues are captured under TL/SO. |
| CAA-I5-UCX4-DL | I5 | DL | UCX4 | N/A |  | Duration (too long) is captured as timing too late (TL) for decision/mitigation application. |
| CAA-I5-UCX4-TE | I5 | TE | UCX4 | N/A |  | “Too early” is not applicable in this abstraction. |
| CAA-I5-UCX4-TL | I5 | TL | UCX4 | UCA | H7 | Applying an update/mitigation too late can leave known issues in place beyond acceptable limits (UCA8). |
| CAA-I5-UCX4-SO | I5 | SO | UCX4 | UCA | H7 | Applying an update/mitigation without adequate regression evaluation is an out-of-sequence governance action (UCA9). |


### 4.3 UCAs

| UCA Id | Interaction | Unsafe control action (summary) | Hazards | Constraint(s) |
|---|---|---|---|---|---|
| UCA1 | I1 (`accept`) | `accept` returns `true` for ill-formed JSON | H1; H5 | C1 |
| UCA2 | I1 (`accept`) | `accept` returns `false` for well-formed JSON | H2 | C1 |
| UCA3 | I3 (`parse`) | `parse` returns a value inconsistent with the JSON text | H3; H5 | C2 |
| UCA4 | I3 (`parse`)  | `parse` throws or hangs for valid JSON under practical constraints | H2; H4 | C2; C4 |
| UCA5 | I3 (`parse`)  | Errors are signalled ambiguously, enabling misinterpretation | H4; H5 | C6 |
| UCA6 | I5 (triage/update) | Required upstream review/triage is not performed | H7 | C11 |
| UCA7 | I5 (triage/update) | Relevant advisory/issue is incorrectly dismissed | H7 | C11 |
| UCA8 | I5 (triage/update) | Update/mitigation is applied too late | H7 | C11 |
| UCA9 | I5 (triage/update) | Update is applied without adequate regression evaluation | H7 | C11 |

---

## 5. Controller (Functional) Constraints

This step records the **Controller (Functional) Constraints (CFC)** derived from the UCA results.

In this analysis, the term “controller constraint” is interpreted at the same abstraction level as the control structure in Section 3:

- For the **functional parsing loop (CL1)**, the constraints that prevent UCAs are largely expressed as **functional constraints on the `nlohmann/json` service behaviour** (C1–C3), because the UCAs in Section 4 are framed as “unsafe outcome of the `accept`/`parse` control action”.
- For **boundary handling** (error and feedback handling) and **governance**, the constraints are captured as **CSC** items (C6, C11) anchored by existing AOU/JLS statements; they still prevent the associated UCAs, but they are treated as scenario/integration constraints rather than library-functional properties.

### 5.1 CFC constraints derived from UCAs

| Linked UCA(s) | CFC constraint(s) | Why this prevents/avoids the UCA (short) | Links to TSF |
|---|---|---|---|
| UCA1; UCA2 | C1 | Prevents incorrect acceptance/rejection outcomes for `accept` within the defined scope. | JLEX-01 |
| UCA3; UCA4 | C2 | Prevents incorrect parsing outcome or unclear failure signalling for `parse` within the defined scope. | JLEX-02 |
| UCA3 | C3 | Prevents “silent success” on ill-formed input by requiring clear failure signalling. | JLS-24 |

### 5.2 UCA-to-constraint coverage note (non-CFC constraints)

The following UCAs are prevented/mitigated by constraints that are recorded as **CSC** in Section 2.3 because they are primarily **integration/process constraints**:

| UCA | Constraint(s) | Rationale (short) | TSF anchor |
|---|---|---|---|
| UCA5 | C6 | Prevents misinterpretation of feedback/error signalling at the boundary by requiring correct handling of results/exceptions. | AOU-04; AOU-07 |
| UCA6; UCA7; UCA8; UCA9 | C11 (and C5 as parent SLC) | Prevents governance control-loop failures by requiring triage/review/update workflow and safe dependency state management. | AOU-27; AOU-28; AOU-29; JLS-11 |


## 6. Control Loops and Sequences



## 7. Causal Scenarios

The STPA schema records causal analysis results in a Scenarios table that links each causal scenario to a control-loop step (here: **CL1** functional parsing/validation and **CL2** governance), and to the resulting UCA and/or Hazards.

CS Type legend (informal, used here as a compact tag):

- **CS4-P**: controlled-process contribution (service behaviour)
- **CS1-M**: controller/operator misuse or misinterpretation at the boundary
- **CS1-A**: action/process-related contribution (e.g. governance/update practice)
- **CS4-I**: input/environment condition (assumption/constraint violation)
- **CS4-D**: design/platform interaction (boundary-risk factors)

| Scenario Id | CL ref | CS Type | Scenario (compact) | Analysis result | Links to UCA | Links to hazard(s) | Constraint Id | Notes |
|---|---|---|---|---|---|---|---|---|
| CS1.1 | CL1-1 (`accept`) | CS4-P | Service accepts ill-formed JSON | Both | UCA1 | H1; H5 | C1 | Evidence (`TIJ-*`, `WFJ-*`, `NJF-*`, `NPF-*`) reduces likelihood. |
| CS1.2 | CL1-1 (`accept`) | CS4-P | Service rejects well-formed JSON | Both | UCA2 | H2 | C1 | Positive evidence via `WFJ-*` and `PJD-*`. |
| CS1.3 | CL1-3 (`parse`) | CS4-P | Parsing produces inconsistent value | Both | UCA3 | H3; H5 | C2 | Coverage via `PJD-*`, `NPF-*`. |
| CS1.4 | CL1-3 (`parse`) | CS4-P | Parsing throws/hangs under practical constraints | Both | UCA4 | H2; H4 | C2; C4 | Availability is primarily constrained by SLC (C4). |
| CS1.5 | CL1-4 (result/exception handling) | CS1-M | Integrator mis-handles result/exception channel | Both | UCA5 | H4; H5 | C6 | Integration/process scenario (AOU-driven). |
| CS2.1 | CL1-3 (`parse`) | CS4-P | Extreme inputs exhaust resources | Hazard |  | H6 | C4 | Tree does not define explicit size/depth limits; integration may need budgets. |
| CS2.2 | CL1-3 (`parse`) | CS4-D | Platform effects contribute to hangs | Both | UCA4 | H4 | C4 | Boundary-risk; mitigated by CI/analysis evidence. |
| CS3.1 | CL2-1 (triage/update) | CS1-A | Update introduces regression not caught by evidence | Hazard |  | H1; H2; H3; H4; H5; H6 | C11 | Managed by change control and regression expectations. |
| CS3.2 | CL2-1 (triage/update) | CS1-M | Relevant issue/advisory is misclassified | Both | UCA7 | H7 | C11 | See `JLS-11` and `TSF/docs/nlohmann_misbehaviours_comments.md`. |
| CS3.3 | CL2-1 (triage/update) | CS1-A | CI/config drift reduces test effectiveness | Hazard |  | H1; H2; H3; H4; H5; H6 | C11 | Partially covered by `TA-INPUTS`/`TA-SUPPLY_CHAIN`. |
| CS4.1 | CL1-2 (`accept` feedback) | CS1-M | Caller ignores `accept` feedback | Hazard |  | H1; H5 | C6 | Integration misuse; mitigated by correct feedback handling (C6). |
| CS4.2 | CL1-4 (result/exception handling) | CS1-A | Exceptions are left uncaught | Hazard |  | H4 | C6 | Integration error-handling constraint. |
| CS4.3 | CL1-1 (input) | CS4-I | Input encoding violates RFC 8259 assumptions | Hazard |  | H4; H5 | C7 | Anchored by `AOU-05`. |
| CS4.4 | CL1-3 (`parse`) | CS4-I | Duplicate keys introduce ambiguity | Hazard |  | H5 | C8 | Anchored by `AOU-20`. |
| CS4.5 | CL1-3 (`parse`) | CS4-I | Non-decimal numbers are introduced | Hazard |  | H4; H5 | C9 | Anchored by `AOU-22`. |
| CS4.6 | CL1-1 (input) | CS4-I | Data is incomplete/corrupted at boundary | Hazard |  | H5 | C10 | Anchored by `AOU-23`. |

---

## 8. Causal Scenario Constraints

## 9. Misbehaviours and Expectations 

### 9.1 Misbehaviours

In TSF terms, misbehaviours are **anything that can cause a deviation from Expected Behaviour** (`TA-MISBEHAVIOURS_CONTEXT.md`). In this analysis we derive them in two complementary ways:

- **Library misbehaviours (M1–M5)**: the “negative space” of `JLEX-01` / `JLEX-02` and their evidence families.
- **Process/integration misbehaviours (M6–M7)**: violations at the boundary of this component that are explicitly anticipated by the TSF tree (e.g. upstream drift/CVE triage duties via `AOU-28`/`AOU-29`) or are typical for parser integration when input is untrusted (resource exhaustion).

Relative to `JLEX-01` and `JLEX-02`, the following **Misbehaviours (M\*)** are prohibited:

| Misbehaviour Id | Misbehaviour description | Link to hazard(s) |
|---|---|---|
| M1  | Library accepts syntactically ill-formed JSON as well-formed (violation of JLEX-01). | H1; H5 |
| M2  | Library rejects syntactically well-formed JSON that should be accepted (violation of JLEX-01). | H2 |
| M3  | Library produces a parsed `basic_json` value that is not semantically equivalent to the input JSON text (violation of JLEX-02). | H3; H5 |
| M4  | Library hangs or throws for RFC 8259-compliant JSON under practical integration conditions (violation of JLEX-01/02 intent). | H2; H4 |
| M5  | Library behaviour contradicts any specific evidence statement in `WFJ-*`, `TIJ-*`, `NJF-*`, `NPF-*`, or `PJD-*`. | H1; H2; H3; H4; H5 |
| M6  | Integrator/process misbehaviour: upstream bugs/security advisories are not reviewed and known vulnerabilities are not triaged/handled. | H7 |
| M7  | Integrator/environment misbehaviour: untrusted inputs are processed without adequate resource budgets/limits appropriate for the deployment context, enabling resource-exhaustion/DoS. | H6 |

---

### 9.2 Risk Evaluation

In line with RAFIA, risk evaluation considers:

- **Severity (S)**: impact in typical S-CORE deployments if the misbehaviour occurs,
- **Likelihood (L)**: plausibility given the existing test and analysis evidence,
- **Exposure (E)**: how often S-CORE relies on the behaviour in normal operation.

This repository does not provide quantitative field data, so we use a **qualitative** assessment that is consistent with the TSF evidence model: likelihood is judged primarily from test/analysis coverage, process controls, and (where applicable) CI-based indicators (`JLS-54`, `JLS-55`). The purpose of the table below is therefore *prioritisation and transparency* (“why do we think this is acceptable?”), not a precise probabilistic safety case.

Qualitative evaluation:

| Misbehaviour | S | L | E | Risk Category | Justification |
|--------------|---|---|---|---------------|--------------|
| M1 | High | Very low | High | Medium–High | Would fundamentally break input validation; extensive WFJ/TIJ/NJF/NPF testing mitigates likelihood. |
| M2 | Medium | Very low | Medium | Low–Medium | Mainly availability/robustness impact; no such issues observed in the tested domain. |
| M3 | High | Very low | Medium–High | Medium–High | Data corruption is serious; however, PJD/NPF evidence and regression tests reduce likelihood. |
| M4 | Medium | Very low | Medium–High | Medium | Hangs/crashes can be disruptive; CI robustness evidence reduces likelihood, and AOUs require explicit exception handling where exceptions are expected. |
| M5 | Varies | Very low | Varies | Low–Medium | Any contradiction to specific statements is expected to be detected by the mapped test evidence (CI test runs). CI gates (e.g. coverage/PR-count) help prevent coverage and process degradation, but they are not themselves semantic checks. |
| M6 | High | Low–Medium | Medium–High | Medium–High | Severity is high if a known issue is exploitable; likelihood depends on the effectiveness of the review/triage cadence required by `AOU-28`/`AOU-29`. |
| M7 | Medium–High | Medium | Medium–High | Medium–High | Resource-exhaustion is a common parser threat on untrusted inputs; this TSF tree does not specify concrete resource budgets, so deployment context must define them if availability/deadlines are critical. |


## 10. Review STPA results
