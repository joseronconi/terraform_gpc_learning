
variable "project" {
  description = "value of project"
  type        = string
  default     = "data-ai-sandbox"
}

// in this case, variables not declared I can call it in the console
// terraform plan -var="project=data-ai-sandbox" -var="credentials_file=credentials.json" -var="os_image=debian-cloud/debian-10" -var="region=us-central1" -var="zone=us-east1-a"

variable "credentials_file" {
  description = "value of credentials_file"
  type        = string
  default     = "credentials.json"
}

// can be used with environment variables
// run -> export TF_VAR_credentials_file=credentials.json
// and run -> terraform plan -var="prject=data-ai-sandbox"

variable "workflows_names" {
  description = "value of workflows_names"
  type        = list(string)
  default     = ["Terraform-Workflow", "Wurchito-Workflow"]
}

variable "os_image" {
  default = "debian-cloud/debian-10"
}

variable "region" {
  description = "value of region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  type    = any
  default = "us-east1-a"
}

variable "turn_on" {
  type    = bool
  default = true
}

