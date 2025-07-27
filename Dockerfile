FROM python:3.11-slim

# Install system dependencies for OCR and build tools
# This layer installs the core OCR engine (tesseract) with multiple language packs
# along with ghostscript for PDF processing and build‑essentials for compiling any native extensions.
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        tesseract-ocr \
        tesseract-ocr-eng \
        tesseract-ocr-fra \
        tesseract-ocr-deu \
        tesseract-ocr-ita \
        tesseract-ocr-spa \
        tesseract-ocr-frk \
        ghostscript \
        gcc \
        build-essential && \
    rm -rf /var/lib/apt/lists/*

# Install poetry and project dependencies
RUN pip install --no-cache-dir poetry

# Copy only the poetry files to install dependencies
WORKDIR /app
COPY environment.yml /app/environment.yml

# Use poetry to install dependencies defined in environment.yml
# The poetry install command will create its own virtual environment inside the image
RUN poetry config virtualenvs.create false && \
    poetry install --no-root --no-interaction --no-ansi

# Set the default working directory
WORKDIR /app
