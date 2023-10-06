provider "google" {
  project     = "data-ai-sandbox"
  credentials = file("credentials.json")
  region      = var.region
  zone        = var.zone
}

resource "google_project_service" "workflows" {
  service            = "workflows.googleapis.com"
  disable_on_destroy = false
}

resource "google_workflows_workflow" "terraform_workflow_gcp" {
  count = length(var.workflows_names)

  name   = var.workflows_names[count.index]
  region = "us-central1"
  #description     = "A sample workflow"
  #crypto_key_name = "projects/data-ai-sandbox/locations/us-central1/keyRings/KEY_RING/cryptoKeys/KEY_NAME"
  #service_account = google_service_account.workflows_service_account.id
  source_contents = file("Terraform-workflow.yml")
  depends_on      = [google_project_service.workflows]
}

# acessando output de um resource (workflow)
# tipo.nome.algum_output -> ver documentação
# google_workflows_workflow.terraform_workflow_gcp.state

/*
module "my_module" {
  source = "/my_module" #posso passar do git pro exemplo url
  //imputs
}
*/
