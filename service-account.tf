resource "google_service_account" "appengine_sa_account" {
  project = var.project_id
  account_id = var.appengine_sa_account_name
  display_name = var.appengine_sa_display_name
  description = var.service_account_description
}

resource "google_project_iam_member" "appengine_sa_account_iam_member" {
  for_each = toset(var.appengine_sa_roles)
   project = var.project_id
   role = each.value
   member = "serviceAccount:${google_service_account.appengine_sa_account.email}"
}
