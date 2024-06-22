# run: terraform plan -var-file="prod.terraform.tfvars"

additional_tags = {
  "ValuesFrom" = "prod.terraform.tfvars"
  "Env"        = "Prod"
}
