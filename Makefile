# Makefile with common development tasks

.PHONY: setup lint sample-ocr test

# Set up the development environment (install Python packages)
setup:
	@echo "Installing dependencies..."
	pip install -r requirements.txt

# Run a sample OCR pipeline (stub)
sample-ocr:
	@echo "Running sample OCR pipeline..."
	@echo "Placeholder for OCR logic"

# Lint the codebase using flake8
lint:
	@echo "Running flake8..."
	flake8 --ignore=E501

# Run tests using pytest
test:
	@echo "Running tests..."
	pytest
