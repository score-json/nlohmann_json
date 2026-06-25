#!/bin/bash

python3 -m venv .venv
source .venv/bin/activate

# Install trustable
pip install --require-hashes -r .devcontainer/S-CORE/requirements.txt
pip install https://gitlab.com/api/v4/projects/66600816/packages/generic/trustable/v2025.10.22/trustable-2025.10.22-py3-none-any.whl
