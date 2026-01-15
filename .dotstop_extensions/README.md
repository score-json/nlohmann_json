# Custom references

References establish links between the documentation and artifacts of the project, either internal (e.g. lines of code) or external (e.g. files stored on a server). 

For each item of the trustable graph, the hash is calculated by trudag using:
   
* its own name
* the text of its own statement
* its normativity status
* for every of its references, the *content* of that reference
* for every of its fallacies, the description and content of the corresponding reference

Custom references are defined and implemented in `references.py`. A (custom) reference is used by adding a corresponding entry into the references list in the header of an item file. The type of this entry corresponds to the `classmethod` type of a reference class in `references.py`, and the remaining fields must map to the constructor arguments of the reference class.

## CPPTestReference

A `CPPTestReference` points to a specific C++ test-case or a nested section within a unit test file and includes the exact lines of code for that section in the reference content. The section path is specified using semicolons to denote nesting in the name field (for example, “TEST_CASE_NAME;SECTION_A;SECTION_B”), and the referenced text is presented as a C++ code block in the rendered documentation.

The reference locates the requested `TEST_CASE` or `SECTION` by name and follows any nested sections indicated by semicolons in the order they appear. It assumes the conventional brace layout used in the `nlohmann/json` tests, where the opening brace follows immediately after the declaration line and the closing brace has matching indentation. The content returned for hashing is the section’s exact source text in UTF-8, and the documentation renders the section cleanly as a C++ code block with indentation normalized when appropriate.

For the `CPPTestReference` The expected configuration is:
```
---
...

references:
- type: cpp_test
  name: "compliance tests from json.org;expected failures"  # Uses semicolon-separated section names to identify nested sections (e.g., "TEST_CASE_NAME;SECTION_A;SECTION_B")
  path: "tests/src/unit-testsuites.cpp"
---
```

## JSONTestsuiteReference

A `JSONTestsuiteReference` bundles a selected C++ test section together with one or more external JSON test files and uses both as the reference content. It is designed for tests that read JSON samples from files, allowing the documentation to present the JSON data alongside the test code. The external JSON files are fetched from a known test-data branch and must be referenced by the selected C++ section.

The reference extends `CPPTestReference` by supplementing the identified C++ section with the content of the listed JSON files. It combines the test code and JSON data into a single payload for hashing, ensuring that the evidence reflects both the test harness and its inputs. In the documentation, each JSON file is shown either in full or replaced by a link if the file is very large, and the relevant C++ section is rendered below; an optional description appears above the content. If enabled, the reference filters lines in the displayed C++ section that mention other JSON files not included in the selection, while the underlying content still includes the full section text used for hashing.

For the `JSONTestsuiteReference` The expected configuration is:
```
---
...

references:
- type: JSON_testsuite
  name: "compliance tests from json.org;expected failures"
  path: "tests/src/unit-testsuites.cpp"
  test_suite_paths: # List of JSON file paths (strings) to load from the test data branch
    - "/json_tests/fail2.json"
    - "/json_tests/fail3.json"
  description: "invalid json"
  remove_other_test_data_lines: False # optional, the default value is True; Removes all other test data lines in the test case or in a section of the test case, as given by the value of "name"
---
```

## FunctionReference

A `FunctionReference` identifies and extracts the full source code of a single C++ member function that is defined inside a class in a given header file. The content includes all comments and spans from the function’s signature line through its closing brace. If multiple definitions with the same name exist inside the class, an overload index can be used to select the nth one from top to bottom.

The reference uses a name in the format `ClassName::FunctionName` together with the file path to find the class and the matching function inside the class body. When an overload index is provided, it selects the nth function definition encountered within the class; if no index is given, the first definition is used. The content returned for hashing is the function’s exact source code, and the documentation renders it as a C++ code block with an optional description shown above. This reference is intended for inline method definitions within headers and does not cover out-of-class implementations.

For the `FunctionReference` an example is:
```
---
...

references:
- type: function_reference
  name: "basic_json::accept"
  path: "include/nlohmann/json.hpp"
---
```

Additionally, it is possible, but not mandatory, to provide a `description` and an `overload` parameter. The full example including all parameters is:
```
---
...

references:
- type: function_reference
  name: "basic_json::accept"
  path: "include/nlohmann/json.hpp"
  description: "the public interface of the `accept`-functionality of nlohmann/json"
  overload: 2
---
```

## WebReference

The content of a `WebReference` is its `url` string. This is suitable when the page is expected to change continuously (e.g., dashboards or status pages), but the type of content and its supportive role are considered sufficient if the URL is reachable. An example is `https://introspector.oss-fuzz.com/project-profile?project=json`, where the most recent fuzz-testing report for nlohmann/json is published. Additionally, an optional `description` can be provided.

The reference stores the `url` string as its content and presents it directly in the report. If a description is provided, it appears beneath the URL to clarify the relevance of the link. This reference pairs well with availability validators (like `https_response_time`), which can confirm that the page is reachable without relying on the page’s changing text.

For the `WebReference`, an example is:
```
---
...

references:
- type: website
  url: "https://math.stackexchange.com/"
---
```
An example of `WebReference` with non-empty description is:
```
---
...

references:
- type: website
  url: "https://ncatlab.org/nlab/show/smooth+Serre-Swan+theorem"
  description: "Wiki article on the smooth Serre-Swan theorem"
---
```

## WebContentReference

A `WebContentReference` captures the fetched body of a URL as its content and is intended for relatively static resources where the actual text on the page matters for the documentation. The URL is rendered in the report, optionally followed by a description. An example is a file located on a github repository, e.g.  `https://raw.githubusercontent.com/nlohmann/json/refs/heads/develop/.github/workflows/cifuzz.yml`.

The reference downloads the page content from the given URL and uses it directly for hashing so that the evidence reflects the text as it existed at the time of retrieval. In the documentation, the URL and optional description are shown, while the full downloaded text is included in the content used for trustability, which allows the reference to anchor the documentation to a specific, stable version of the page or file.



A `WebContentReference` looks identical to a `WebReference` with `type: web_content` instead of `type: website`.

For the `WebContentReference`, examples of the possible configurations are:
```
---
...

references:
- type: web_content
  url: "https://math.stackexchange.com/"
---
```
in case of an empty description, and
```
---
...

references:
- type: web_content
  url: "https://ncatlab.org/nlab/show/smooth+Serre-Swan+theorem"
  description: "Wiki article on the smooth Serre-Swan theorem"
---
```
in case of a custom description.

## TimeVaryingWebReference

Use this reference when the content of a site changes continuously, but the mere existence and reachability of the site is not sufficient to support the statement. In other words, use this reference if the site requires regular re-reviews. The content for hashing is the changelog file from this repository prefixed with the URL. For example, https://github.com/nlohmann/json/pulse/monthly can be used to demonstrate that `nlohmann/json` is up to the most recent version under active development. The content of a `TimeVaryingWebReference` is determined by a changelog file in this repository. By default, this is `ChangeLog.md`, which mirrors the upstream changelog of `nlohmann/json`. 

As with WebReference, consider an https_response_time validator to check reachability of the URL if needed.

Important clarifications:

The system checks the `ChangeLog.md` within our own repository. It does not read or rely on external changelogs or any files in external repositories.
Whenever `nlohmann/json` publishes a new release/patch and we integrate it into our repository, our `ChangeLog.md` will be updated accordingly (since we mirror upstream changes). Any change to this changelog will automatically set the review_status of all statements with TimeVaryingWebReferences to unreviewed, meaning they are invalidated and must be re-reviewed.
The changelog argument defaults to `ChangeLog.md`, which is the correct path to the changelog in this repo. You only need to specify the changelog argument if the file is moved or renamed.
An example of the complete configuration for `TimeVaryingWebReference` (overriding the changelog path) is:


---
...
references:
- type: project_website
  url: "https://ncatlab.org/nlab/show/smooth+Serre-Swan+theorem"
  description: "Wiki article on the smooth Serre-Swan theorem"
  changelog: "ideas/graded/graded_Serre_Swan.tex"
---

In the common case (using the default ChangeLog.md in this repository), you can omit the `changelog` argument:


---
...
references:
- type: project_website
  url: "https://github.com/nlohmann/json/pulse/monthly"
  description: "Development activity for nlohmann/json"
---
Both `description` and `changelog` are optional arguments.

## ListOfTestCases

A `ListOfTestCases` reference produces a markdown overview of all unit tests and nested sections found in the provided directories and files and augments this structure with recent execution environments from a test-results database (currently "artifacts/MemoryEfficientTestResults.db"). This provides a concise map of the test suite together with information on where it has been executed successfully or with skips.

The reference scans files matching the pattern `unit-*.cpp` to extract `TEST_CASE` and `SECTION` names and their nesting, and it formats the results as nested lists to mirror the test structure. It then queries the database of recent test runs to list the compiler and standard combinations that executed all tests without skipping, as well as those where some tests were skipped, and it incorporates these details into the same markdown report. The content returned for hashing is the complete markdown report, which the documentation also renders directly.


Further, it is assumed that a unit-test-file is structured as

```
...
TEST_CASE("my test case")
{
    ...
    SECTION("my section")
    {
        ...
    }
    ...
}
```

and the structure regarding test-cases and (nested) sections of test-cases is extracted. 

The expected configuration is: 

```
---
...
references:
- type: list_of_test_cases
  test_files:
    - TSF/tests
    - tests/src
---
```

## workflow_failures

This reference queries Github Actions (`https://github.com/{self._owner}/{self._repo}/actions?query=is%3Afailure+branch%3A{self._branch}`) for failed workflow runs and records the number as content. This allows the documentation to include the current failure count as evidence without embedding the page itself.

The reference constructs a URL that filters workflow runs by failure status, optionally restricting the query to a specific branch, and it extracts the number displayed at the top of the results table. It returns this number as the content used for hashing, and in the documentation it presents a short sentence indicating the count and, when applicable, the branch to which the count refers.

The expected configuration is: 

```
---
...
references:
- type: workflow_failures
      owner: "eclipse-score"
      repo: "inc_nlohmann_json"
      branch: "json_version_3_12_0"
---
```

## ItemReference

An `ItemReference` documents inheritance of references from other items so that shared evidence does not need to be repeated across multiple supporting items. In the rendered documentation, it lists links to the referenced items so readers can navigate to the source evidence.

The reference reads entries from the local trustable graph file and combines the signatures of the referenced items into its content, thereby tying the current item’s trustability to those items’ evidence. In the documentation, it prints a list of hyperlinks pointing to the target items, and any change in the referenced items’ evidence automatically propagates to the dependent item through this linkage. If any reference of any of the listed supported items changes, then its sha changes and the review-status of the item becomes false. After successful re-review, the review-status of the supported items is re-set to true, so that the new sha is stored in the `.dotstop.dot` file. This automatically sets the review-status of the supporting items, which inherit the references, to false, thereby triggering a re-review of these.

The expected configuration is:

```
---
...
references:
- type: item
  items:
    - ITEM-1
    - ITEM-2
    - ...
---
...
```
Here, the elements of the list `items` must be normative nodes of the trustable graph, otherwise an error is thrown.

## IncludeListReference

An `IncludeListReference` extracts all `#include` lines from a specified source or header file (e.g., single_include/nlohmann/json.hpp) and uses them as the content. It is useful for showing direct dependencies of a file without embedding its full text.

The reference reads the target file and collects only those lines whose first non-whitespace characters form a `#include` directive, removing inline comments where necessary to present a clean list. It returns the list of includes as the content used for hashing, or a placeholder message when the file contains no includes, and it renders the includes as a C++ code block in the documentation with an optional `description` above the block.

The expected configuration is: 

```
---
...

references:
- type: include_list
  path: "single_include/nlohmann/json.hpp"
  description: "List of direct includes of the amalgamated header"
---
```

# Validators

Validators are extensions of trudag that assess evidence by computing floating-point scores from measurable data. These scores provide quantitative support for the trustability of items in the trustable graph and are combined with the items’ references and statements during hashing and reporting. The implementation of the validators can be found in validators.py.

## check_artifact_exists

The `check_artifact_exists` validator confirms whether the expected GitHub Actions artifacts exist for the current commit SHA and assigns a score based on how many of the requested artifacts were found relative to how many were expected. The configuration consists of keys that correspond to known artifact names (namely `check_amalgamation`, `codeql`, `dependency_review`, `labeler`, `test_trudag_extensions`, and `ubuntu`) and values that specify whether each artifact should be included as part of the evidence (“include”) or excluded from consideration (“exclude”). The validator interprets this mapping to determine the expected set and then compares it against the artifacts available for the current build to derive the score.

The available configuration dict keys for check_artifact_names are:
  - `check_amalgamation`
  - `codeql`
  - `dependency_review`
  - `labeler`
  - `test_trudag_extensions`
  - `ubuntu`

The available configuration dict values for check_artifact_names are:
  - 'include'
  - 'exclude'

## https_response_time

The `https_response_time` validator measures how quickly a list of websites responds and derives a score based on the responsiveness and the HTTP status code. The configuration specifies an acceptable response time threshold in seconds and a list of URLs to check. Any URL that responds in at least five times the acceptable threshold, or that returns a non-200 response code, receives an individual score of zero. The final score is calculated as the mean of all individual scores across the list of URLs, which encourages fast and reliable endpoints and flags unresponsive or failing sites.

The expected configuration is:
```    
evidence:
    type: https_response_time    
    configuration:
        target_seconds: 2 # acceptable response time in seconds, integer or float
        urls: # list of urls to be checked, list of strings
            - "https://github.com/nlohmann/json/issues"
            - "https://github.com/nlohmann/json/graphs/commit-activity"
            - "https://github.com/nlohmann/json/forks?include=active&page=1&period=&sort_by=last_updated"
```

## check_test_results

The `check_test_results` validator analyzes the most recent unit test outcomes stored in a SQLite database generated by the ubuntu workflow and calculates a score that reflects the proportion of passed test cases among those that were executed. The `configuration` lists the test files of interest (by their base names without the “unit-” prefix or file extension) and optionally overrides the `database` file path and `table` name. For each specified test, the validator counts the passed and failed cases and ignores skipped cases to compute an individual pass ratio. The overall score is the mean of these ratios, which provides a balanced measure of recent test success across the selected test files.

The expected configuration is:

```
evidence:
    type: check_test_results
    configuration:
        tests: # list of test-files 
            - class_lexer
            - unicode1
            - strings
        database: MemoryEfficientTestResults.db # optional argument, default: MemoryEfficientTestResults.db; path to test-result database from project root
        table: test_results # optional argument, default: test_results; name of table in database
```

The test-files are called unit-FILE_NAME.cpp. In the configuration, FILE_NAME is expected only, i.e. without the leading unit- and without the file-extension.

## check_issues

The automatic validator `check_issues` is intended to evaluate the json-lists `raw_open_issues.json` and `raw_closed_issues.json` and compare with the list of known issues of nlohmann/json labelled as bug opened since the release of the version of nlohmann/json that is documented. The json lists are generated in the publish_documentation-Workflow, and not persistently stored.

The expected configuration is given as follows:

```
evidence:
    type: check_issues
    configuration:
        release_date: "2025-04-11T00:00:00Z" # release date of the documented version in the format %Y-%m-%dT%H:%M:%SZ
        list_of_known_misbehaviours: "./TSF/docs/nlohmann_misbehaviours_comments.md" # path to the list of known misbehaviours relative to the root of the repository 

```

In case that the release date is not specified using the expected format, or either of the `raw_open_issues.json` and `raw_closed_issues.json` can not be opened, then the score 0.0 is returned together with an error indicating the warning.

The list of known misbehaviours collects the known issues labelled as bugs opened in nlohmann/json since the release of the version that is documented.
These issues are collected in a table containing the issue-ID, an indication whether the issue applies to the usage of nlohmann/json within Eclipse S-CORE and a comment, which is printed into the list of known misbehaviours.
From `raw_closed_issues.json`, all issue IDs are collected, which are labelled as bug and opened after the release_date; and from `raw_open_issues.json`, all issue IDs are collected.
If for any of these IDs, it is not explicitly indicated in the list of known misbehaviours that this issue does not apply to Eclipse S-CORE, then the score 0.0 is returned.
Otherwise, the score 1.0 is assigned.

## did_workflows_fail

The `did_workflows_fail` validator checks the results of GitHub Actions runs for a repository, optionally filtered by event and branch, and produces a binary score indicating whether any runs failed. It constructs a query that lists workflow results matching failure status and then reads the number displayed at the top of the results table. If the number is zero, it returns a score of 1.0 to indicate no failures; otherwise, it returns 0.0 with a warning. If the GitHub page cannot be reached or the number of failed runs cannot be parsed, the validator returns 0.0 with an error. The configuration requires the repository owner and name and may include the branch and event, with “push” as the default event. It is important to enclose all configuration values in quotation marks to ensure the update helper processes them correctly.

The expected configuration is:

```
evidence:
    type: did_workflows_fail
    configuration:
        owner: "eclipse-score" # owner of the repository
        repo: "inc_nlohmann_json" # name of the repository
        branch: "json_version_3_12_0" # name of the branch
        action: "push" # optional, default is push
```


## coveralls_reporter

The coveralls_reporter validator queries the Coveralls API [coveralls](https://coveralls.io/) for the current line and branch coverage figures and compares them with expected values specified in the configuration. It returns a score of 1.0 if both fetched coverage numbers, rounded to a configurable number of decimal digits, match the given expectations and returns 0.0 otherwise. The configuration includes the Coveralls project coordinates (owner, repo, and optionally branch), the expected coverage values, and the rounding precision, which defaults to three decimal digits. When no branch is provided, the validator uses the most recent coverage values, although specifying a branch is recommended for consistent comparisons.

Unless the version of `nlohmann/json` documented in this repository changes, it is expected that both coverage numbers remain constant.

The expected configuration is:

```
evidence:
    type: coveralls_reporter
    configuration:
        owner: "score-json"
        repo: "json"
        branch: "main"
        line_coverage: 99.186
        branch_coverage: 93.865
        digits: 3
```

# Data store interface

The data store interface utilises the built-in the `dump` functionality of trudag to store the trustable score, and to include the development of the trustable score over time into the report.

Since no persistent data store is established as of now, the current implementation serves as a proof of concept, where the collected data are stored on a separate branch of the repository.

The input of the data store are the data generated by the trudag tool during the `score` or `publish` operation. These data have the format:

```
[{"scores": [{id: "ID-1", "score": score}, ...], "info": {"Repository root": "my_repository", "Commit SHA": "sha_123", "Commit date/time": <unix_timestamp>, "Commit tag": "my_tag", "CI job id": 123, "Schema version": 123, "Branch name": "my_branch"}}]
```

Note: Starting with trudag v2025.09.16, "Commit date/time" is a unix timestamp (integer) instead of a formatted string. The values for "Commit SHA", "Commit tag", "CI job id", and "Branch name" can also be `None`.

## push

This functionality writes the generated data into an sqlite database `TrustableScoring.db` located in the folder `TSF`. This database contains two tables, `commit_info`, where the metadata of "info" are stored, and `scores`, where the scores are stored, and which references `commit_info` via the date as foreign key.

It is intended to store data only once per commit. If, for any reason, the same commit generates data more than once, then only the most recent data are stored, and the obsolete data are deleted. This still ensures that the scoring history of the main branch is as complete as possible.

## pull

This functionality parses the information stored in `TrustableScoring.db` into the format which is expected by trudag. In case that no data is found, the empty history is returned.