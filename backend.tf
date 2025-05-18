terraform {
  backend "gcs" {
    bucket  = "bucket-usdev-samsung-statefiles-str01"       # Replace with your bucket name
    #prefix  = "projects/${var.project_id/region}"          # Variables may not be used here.
     prefix  = "projects/pid-usdev-atoberg-s24-res01/us-east1"
  }
}
