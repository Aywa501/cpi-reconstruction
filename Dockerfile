FROM python:3.11-slim

# Install Tesseract OCR and language packs
RUN apt-get update && apt-get install -y --no-install-recommends \
    tesseract-ocr \
    tesseract-ocr-eng \
    tesseract-ocr-fra \
    tesseract-ocr-deu \
    tesseract-ocr-ita \
    tesseract-ocr-spa \
    tesseract-ocr-frk \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy environment specification
COPY environment.yml ./environment.yml

# Copy source code
COPY . .

# Default command starts Python interpreter
CMD ["python3"]
