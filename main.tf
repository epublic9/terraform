resource "google_project" "project" {
  name       = var.project_name
  project_id = var.project_id
#  org_id     = var.org_id
  billing_account = var.billing_account_id
}

resource "google_project_service" "services" {
  for_each = toset(var.api_services)
  project  = google_project.project.project_id
  service  = each.key
  disable_on_destroy = false
}
