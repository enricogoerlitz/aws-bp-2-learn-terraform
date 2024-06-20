# run: terraform plan -var-file="dev.terraform.tfvars"

additional_tags = {
  "ValuesFrom" = "dev.terraform.tfvars"
  "Env" = "Dev"
}
