---
level: 1.1
normative: false
---

**Guidance**

This assertion is satisfied if each iteration of XYZ is *repeatable*, with all
required inputs controlled, and *reproducible* (covering both XYZ and the
construction toolchain/environment, as described in TA-TESTS).

This assertion can be most effectively satisfied in a Continuous Integration
environment with mirrored projects (see TA-SUPPLY_CHAIN) and build servers
without internet access. The aim is to show that all build tools, XYZ
components, and dependencies are built from controlled inputs, that rebuilding
produces the same binary fileset, and that builds can be repeated on any
suitably configured server, with server differences shown not to affect
reproducibility.

For releases in particular, builds from source must be shown to produce
identical outputs both with and without cache access. 

Again this will not be achievable for components/tools provided in binary form,
or accessed via an external service - we must consider our confidence in
attestations made by/for the supply chain.

All non-reproducible elements, such as timestamps or embedded random values from
build metadata, are clearly identified and considered when evaluating
reproducibility.

As a result, we gain increased confidence that the toolchain behaves correctly
during version upgrades: unintended changes to the project are avoided, intended
fixes produce the expected effects, and the constructed output of XYZ shows the
correct behavioural changes, verified and validated with test results according
to TT-RESULTS analysis.

**Evidence**

- list of reproducible SHAs
  - **Answer**: 
- list of non-reproducible elements with:
  - explanation and justification
    - **Answer**: 
  - details of what is not reproducible
    - **Answer**: 
- evidence of configuration management for build instructions and infrastructure
  - **Answer**: 
- evidence of repeatable builds
  - **Answer**: 

**Confidence scoring**

Calculate:

R = number of reproducible components (including sources which have no build stage)
N = number of non-reproducible
B = number of binaries
M = number of mirrored
X = number of things not mirrored

Confidence scoring for TA-RELEASES could possibly be calculated as
R / (R + N + B + M / (M + X))

**Checklist**

- How confident are we that all components are taken from within our
  controlled environment?
  - **Answer**: 
- How confident are we that all of the tools we are using are also under our
  control?
  - **Answer**: 
- Are our builds repeatable on a different server, or in a different context?
  - **Answer**: 
- How sure are we that our builds don't access the internet?
  - **Answer**: 
- How many of our components are non-reproducible?
  - **Answer**: 
- How confident are we that our reproducibility check is correct?
  - **Answer**: 
