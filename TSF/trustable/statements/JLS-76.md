---
level: 1.1
normative: true
references:
  - type: cpp_test
    name: "parse;UTF-8;unexpected BOM"
    path: "TSF/tests/unit-byte_order_mark.cpp"
    description: "This test case is included purely as an example to illustrate the fault‑induction style tests used in nlohmann/json."
  - type: cpp_test
    name: "deserialization;contiguous containers;error cases;case 15"
    path: "tests/src/unit-deserialization.cpp"
    description: "This test case is included purely as an example to illustrate the fault‑induction style tests used in nlohmann/json."
  - type: cpp_test
    name: "parser class - core;parse;string;errors"
    path: "TSF/tests/unit-class_parser_core.cpp"
    description: "This test case is included purely as an example to illustrate the fault‑induction style tests used in nlohmann/json."
---

nlohmann/json does use fault‑induction–style techniques (invalid inputs, resource failures, fuzzing) to demonstrate that code paths which usually succeed in normal usage can and do fail in a controlled, specified way.