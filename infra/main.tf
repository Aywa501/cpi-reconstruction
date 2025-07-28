terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
  # backend "gcs" {
  #   bucket = "cpi-terraform-state"
  #   prefix = "state"
  # }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_service_account" "agent" {
  account_id   = "cpi-agent"
  display_name = "CPI Reconstruction Agent"
}

resource "google_storage_bucket" "raw" {
  name     = "cpi-raw"
  location = var.region
}

resource "google_storage_bucket" "ocr" {
  name     = "cpi-ocr"
  location = var.region
}

resource "google_storage_bucket" "interim" {
  name     = "cpi-interim"
  location = var.region
}

resource "google_storage_bucket" "final" {
  name     = "cpi-final"
  location = var.region
}

resource "google_artifact_registry_repository" "docker_repo" {
  location      = var.region
  repository_id = "cpi-docker"
  description   = "Docker repository for CPI reconstruction"
  format        = "DOCKER"
}

resource "google_billing_budget" "project_budget" {
  billing_account = var.billing_account
  display_name    = "CPI Reconstruction Budget"
  budget_filter {
    projects = [format("projects/%s", var.project_id)]
  }
  amount {
    specified_amount {
      currency_code = "EUR"
      units         = 100
    }
  }
}

resource "google_compute_instance_template" "ocr_template" {
  name_prefix  = "ocr-tmpl"
  machine_type = "n2-standard-16"
  tags         = ["ocr"]

  scheduling {
    preemptible       = true
    automatic_restart = false
  }

  service_account {
    email  = google_service_account.agent.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y tesseract-ocr tesseract-ocr-eng tesseract-ocr-fra tesseract-ocr-deu tesseract-ocr-ita tesseract-ocr-spa tesseract-ocr-frk
    # mount GCS buckets using gcsfuse (if installed)
    # Example:
    # mkdir -p /mnt/raw && gcsfuse cpi-raw /mnt/raw
    EOF
}
