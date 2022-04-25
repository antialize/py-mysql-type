#!/bin/bash
set -euo pipefail
docker build -t localhost/python-statfs:latest .
docker run localhost/python-statfs:latest tar c dist | tar x dist
