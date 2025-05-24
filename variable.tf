variable "project_id" {
  description = "The ID of the project where all GCP resources created."
}

variable "project_name" {
  description = "The name of the new project"
  type        = string
}

variable "region" {
  description = "Region"
  type        = string
  default     = "us-east1"
}

variable "billing_account_id" {
  description = "Billing account ID"
  type        = string
}

#variable "org_id" {
 # description = "Organization ID"
#  type        = string
#}
############################## SERVICE ACCOUNT ################################

variable "appengine_sa_account_name" {
  description = "The name service account."
}

variable "service_account_description" {
  description = "provide description for the service account."
}

variable "appengine_sa_display_name" {
  description = "This is display name for service account."
}

variable "appengine_sa_roles" {
  description = "provide the list roles details you want grant access to SA"
}

######################## API SERVICES ############################################

variable "api_services" {
  description = "List of APIs to enable"
  type        = list(string)
}
