---
level: 1.1
normative: true
references:
    - type: item
      items:
        - JLEX-02
    - type: function_reference
      name: "basic_json::parse"
      path: "include/nlohmann/json.hpp"
      description: "the public interface of the `parse`-functionality of nlohmann/json for single inputs"
      overload: 1
    - type: function_reference
      name: "basic_json::parse"
      path: "include/nlohmann/json.hpp"
      description: "the public interface of the `parse`-functionality of nlohmann/json for iterator inputs"
      overload: 2
    - type: function_reference
      name: "basic_json::parse"
      path: "include/nlohmann/json.hpp"
      description: "the public interface of the `parse`-functionality of nlohmann/json for input buffer"
      overload: 3
    - type: function_reference
      name: "parser::sax_parse_internal"
      path: "include/nlohmann/detail/input/parser.hpp"
      description: "called by parser::sax_parse"
    - type: function_reference
      name: "json_sax_dom_parser::null"
      path: "include/nlohmann/detail/input/json_sax.hpp"
      description: "internal DOM-construction handler mapping the JSON literal `null` to a `basic_json` null value"
    - type: function_reference
      name: "json_sax_dom_parser::boolean"
      path: "include/nlohmann/detail/input/json_sax.hpp"
      description: "internal DOM-construction handler mapping JSON booleans to `basic_json` boolean values"
    - type: function_reference
      name: "json_sax_dom_parser::number_integer"
      path: "include/nlohmann/detail/input/json_sax.hpp"
      description: "internal DOM-construction handler mapping JSON integer numbers to `basic_json` integer values"
    - type: function_reference
      name: "json_sax_dom_parser::number_unsigned"
      path: "include/nlohmann/detail/input/json_sax.hpp"
      description: "internal DOM-construction handler mapping JSON unsigned numbers to `basic_json` unsigned values"
    - type: function_reference
      name: "json_sax_dom_parser::number_float"
      path: "include/nlohmann/detail/input/json_sax.hpp"
      description: "internal DOM-construction handler mapping JSON floating-point numbers to `basic_json` floating-point values"
    - type: function_reference
      name: "json_sax_dom_parser::string"
      path: "include/nlohmann/detail/input/json_sax.hpp"
      description: "internal DOM-construction handler mapping JSON strings to `basic_json` string values"
    - type: function_reference
      name: "json_sax_dom_parser::start_object"
      path: "include/nlohmann/detail/input/json_sax.hpp"
      description: "internal DOM-construction handler creating an object value when parsing a JSON object"
    - type: function_reference
      name: "json_sax_dom_parser::start_array"
      path: "include/nlohmann/detail/input/json_sax.hpp"
      description: "internal DOM-construction handler creating an array value when parsing a JSON array"
score:
    ThomasClausnitzer: 1.0
---

The service provided by the nlohmann/json library transforms a JSON text into a C++ representation using C++ containers (for arrays and objects) and primitive datatypes (for strings, numbers, boolean, null).
