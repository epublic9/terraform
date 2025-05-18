####################### project details ##########################
project_id = "pid-usdev-atoberg-s24-res01"
billing_account_id = "017C00-C2558F-9F2F13"
org_id =
project_name       = "My Atomberg"
region             = "us-east1"

############################# API SERVICES ######################

api_services = [
  "compute.googleapis.com",
  "iam.googleapis.com",
  "cloudresourcemanager.googleapis.com",
  "servicemanagement.googleapis.com",
  "serviceusage.googleapis.com"
]

#####################  SERVICE ACCOUNT DETAILS ###################
appengine_sa_account_name = "appengine_resource"
appengine_sa_display_name = "appengine service account"
service_account_description = "created for appegine"
appengine_sa_roles = ["roles/owner"]



