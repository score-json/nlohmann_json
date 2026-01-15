#!/bin/bash

python3 -m venv .venv
source .venv/bin/activate

# Install trustable
pip install --require-hashes -r .devcontainer/S-CORE/requirements.txt
pip install git+https://gitlab.com/CodethinkLabs/trustable/trustable@83b4023d7e2bd2b984db2c81543266ce09a7cbf7
