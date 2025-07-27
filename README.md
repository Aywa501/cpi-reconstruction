# CPI Reconstruction

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![CI](https://github.com/Aywa501/cpi-reconstruction/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/Aywa501/cpi-reconstruction/actions/workflows/ci.yml)

This project aims to reconstruct the Consumer Price Index from historical sources using OCR and data processing pipelines. It includes scripts and notebooks to process raw page images, extract and clean data, and produce CPI series for further analysis and research.

## Quick Start

To build the Docker image and set up the development environment:

```
# Build the image (from repo root)
docker build -t cpi-recon .

# Set up your environment with Poetry (inside container or host)
make setup
```

This repository is released under the [MIT License](LICENSE).
