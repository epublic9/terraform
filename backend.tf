terraform {
  backend "gcs" {
    bucket  = "bucket-usdev-samsung-statefiles-str01"       # Replace with your bucket name
    prefix  = "projects/${var.project_id/region}"          # Logical folder path
  }
}
