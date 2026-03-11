# Sample of closed upstream misbehaviours (pre-3.12.0)

This file collects and comments a small **sample** of *closed* upstream bug issues from the original [`nlohmann/json`](https://github.com/nlohmann/json) repository.

Selection criteria:
- Issue is **closed** and labeled **`kind: bug`** upstream.
- Issue was **closed before** the upstream release of **v3.12.0** (published at `2025-04-11`).
- A **random sample of 20** issues was taken from the upstream query: [closed `kind: bug` before v3.12.0](https://github.com/nlohmann/json/issues?q=is%3Aissue+is%3Aclosed+label%3A%22kind%3A+bug%22+closed%3A%3C2025-04-11)

## sampled closed misbehaviours

issue-id | applies to S-CORE | comment
---------|-------------------|--------
[2147](https://github.com/nlohmann/json/issues/2147) | No | Compilation error report for very old GCC (4.8.5) with `std::bind`/`std::function`. Resolution: closed after ≈2.5 months as stale.
[2574](https://github.com/nlohmann/json/issues/2574) | No | `get<std::array<T,N>>()` fails for non-default-constructible element types; only relevant if S-CORE relies on this conversion pattern. Resolution: closed after ≈3.5 months (fix proposed upstream).
[2655](https://github.com/nlohmann/json/issues/2655) | No | `std::pair` serialization expectation mismatch; closed as `wontfix`/documentation topic. Resolution: reviewed and closed after ≈5 months.
[2676](https://github.com/nlohmann/json/issues/2676) | No | NVCC warnings when instantiating templates under CUDA; only relevant for CUDA/NVCC consumers. Resolution: closed after ≈10 months (fix proposed upstream).
[2725](https://github.com/nlohmann/json/issues/2725) | No | Build with `-fno-exceptions` (and/or `JSON_NOEXCEPTIONS`) still hits `throw`; only relevant if S-CORE disables exceptions. Resolution: closed the same day (fix proposed upstream).
[3025](https://github.com/nlohmann/json/issues/3025) | No | Brace-initialization in function calls can select a copy path (`func({j});` prints `10` instead of `[10]`); API pitfall for integrators. Resolution: closed next day as duplicate.
[3156](https://github.com/nlohmann/json/issues/3156) | No | `std::filesystem::path` conversions unavailable for older macOS deployment targets even with C++17; only relevant for macOS consumers. Resolution: closed the same day (duplicate / follow-up tracked upstream).
[3542](https://github.com/nlohmann/json/issues/3542) | No | AddressSanitizer container-overflow report in diagnostics code path on Windows/MSVC test configuration. Resolution: eventually closed (≈2.5 years after report).
[3704](https://github.com/nlohmann/json/issues/3704) | No | `operator[]`/`.at()` to `std::string const&` binds a temporary; use `get_ref` for a real reference (API usage detail). Resolution: closed the same day.
[4019](https://github.com/nlohmann/json/issues/4019) | No | `flatten()` fails to compile when using an alternative string type; only relevant if S-CORE uses non-`std::string` `string_t`. Resolution: closed after ≈21 months (issue confirmed; fix proposed upstream).
[4066](https://github.com/nlohmann/json/issues/4066) | No | Parsing freeze reported on a constrained platform (Nintendo Switch) with a larger JSON input. Resolution: closed within ≈1 day.
[4116](https://github.com/nlohmann/json/issues/4116) | No | GCC `-Wodr` warning about potential ODR violations in the single-header build; toolchain-warning only. Resolution: closed the same day.
[4163](https://github.com/nlohmann/json/issues/4163) | No | Deprecation warning about `std::char_traits<unsigned char>` when parsing binary formats from `std::vector<std::uint8_t>`; warning-only. Resolution: closed after ≈2 months (fix proposed upstream).
[4193](https://github.com/nlohmann/json/issues/4193) | No | SIGSEGV reported while parsing a valid JSON file from a stream (Linux / v3.11.2 / doctest). Resolution: closed the same day.
[4241](https://github.com/nlohmann/json/issues/4241) | No | `#include <version>` can be shadowed by a project-provided header named `version` on the include path; build-environment pitfall. Resolution: closed the same day.
[4284](https://github.com/nlohmann/json/issues/4284) | No | `#pragma pack(push, 1)` can break compilation units and lead to a segfault if packing is not restored; project-level UB/misuse pattern. Resolution: closed within ≈1 week.
[4299](https://github.com/nlohmann/json/issues/4299) | No | Single-element `std::initializer_list` construction can yield an array for strings (e.g., `json{"hello"}`); API pitfall for brace-init. Resolution: closed the same day.
[4332](https://github.com/nlohmann/json/issues/4332) | No | Hex-like git ref string reported as number overflow; likely invalid input/usage rather than a confirmed parser defect. Resolution: closed the same day.
[4427](https://github.com/nlohmann/json/issues/4427) | No | Misfiled “CVE” report describing a Python `jaraco/zipp` issue; not applicable to `nlohmann/json`. Resolution: closed the same day.
[4467](https://github.com/nlohmann/json/issues/4467) | No | C2440 report with missing minimal repro; likely usage/configuration-specific. Resolution: closed within ≈1 week (needs more info).
