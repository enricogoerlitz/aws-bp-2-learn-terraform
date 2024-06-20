# default tfvars file!

# TF_VAR_* > *.tfvars > .auto.tfvars > -var-file={} AND -var={} (highest)

additional_tags = {
  "ValuesFrom" = "terraform.tfvars"
}
