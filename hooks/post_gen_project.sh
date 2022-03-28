#!/bin/bash

python3.9 -m venv .venv
source .venv/bin/activate
pip install -U pip setuptools wheel
pip install -r requirements/dev.txt