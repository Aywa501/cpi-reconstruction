# Infrastructure

This directory contains Terraform configuration for the CPI reconstruction project. The Terraform code provisions a Google Cloud project, a service account, four storage buckets for each stage of the OCR pipeline (`cpi-raw`, `cpi-ocr`, `cpi-interim`, `cpi-final`), an Artifact Registry Docker repository, a billing budget and a preemptible compute instance template for OCR workers. All resource names follow the conventions described in the project documentation.

Before running any Terraform commands, ensure you have the Google Cloud CLI and Terraform installed. Authenticate by exporting the `GOOGLE_APPLICATION_CREDENTIALS` environment variable to point to a service account JSON key with permissions to create resources. Then initialise Terraform and review the plan:

```
terraform init
terraform plan
```

The `main.tf` file contains a commented‑out backend block referencing a future GCS bucket (`gs://cpi-terraform-state`). Uncomment and adjust this when you have provisioned a remote state bucket.
