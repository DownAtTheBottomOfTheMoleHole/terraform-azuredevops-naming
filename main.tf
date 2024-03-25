##############################################################
#######               Main Resources                   #######
##############################################################


## below are example resources please update/remove as you see fit ##
resource "random_password" "aws_pass" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"

  keepers = {
    # Generate a new id each time we change environment, subscription, application name, application short name, resource location or project name
    application_name      = var.application_name
    application_shortname = var.application_shortname
    environment_tag       = var.environment_tag
    project_name          = var.azdo_project_name
    resource_location     = var.aws_resource_location
    profile               = var.aws_profile

  }
}

resource "random_password" "azure_pass" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"

  keepers = {
    # Generate a new id each time we change environment, subscription, application name, application short name, resource location or project name
    application_name      = var.application_name
    application_shortname = var.application_shortname
    environment_tag       = var.environment_tag
    project_name          = var.azdo_project_name
    resource_location     = var.azrm_resource_location
    subscription_id       = var.azrm_subscription_id

  }
}


resource "time_offset" "secret_expiry" {

  offset_years = 2

}

resource "time_offset" "spn_password_expiry" {

  offset_years = 100

}

##############################################################
#######                LOCALS                          #######
##############################################################

locals {

  #Default tags
  tags = {
    Application = var.application_name
    ADO-Project = var.azdo_project_name
    Repository  = var.azdo_repo_name
    Environment = var.environment_tag
    Managed-By  = "Terraform"
    Owner       = join(" ", [var.azdo_project_name, "Contributors"])
  }

}
