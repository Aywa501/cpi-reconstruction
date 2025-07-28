output "service_account_email" {
  description = "Email of the service account used by OCR workers"
  value       = google_service_account.agent.email
}

output "docker_repository" {
  description = "Docker repository resource name"
  value       = google_artifact_registry_repository.docker_repo.name
}

output "instance_template" {
  description = "OCR instance template self link"
  value       = google_compute_instance_template.ocr_template.self_link
}
