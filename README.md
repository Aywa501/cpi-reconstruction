# CPI Reconstruction

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![CI](https://github.com/Aywa501/cpi-reconstruction/actions/workflows/ci.yml/badge.svg?branch=setup/step0)](https://github.com/Aywa501/cpi-reconstruction/actions/workflows/ci.yml)
[![GCP Ready](https://img.shields.io/badge/GCP-ready-blue)](https://cloud.google.com)

This project reconstructs the Consumer Price Index from historical sources using OCR and data processing pipelines. It provides scripts and notebooks to process raw page images, extract and clean data, and produce CPI series for analysis and research.

## Quick Start

To build the Docker image and set up the development environment locally, run:

```bash
# Build the Docker image
docker build -t cpi-recon .

# Install Python dependencies
pip install -r requirements.txt
```

Alternatively, you can use the provided Makefile targets:

```bash
make setup   # install dependencies
make lint    # run flake8
make test    # run pytest
```

This repository is released under the [MIT License](LICENSE).
