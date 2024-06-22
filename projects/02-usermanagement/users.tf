locals {
  users_from_yaml = yamldecode(file("${path.module}/user-roles.yaml")).users
  users_map = {
    for user_config in local.users_from_yaml : user_config.username => user_config.roles
  }
}

resource "aws_iam_user" "users" {
  #   for_each = toset([for user_config in local.users_from_yaml : user_config.username])
  for_each = toset(local.users_from_yaml[*].username)
  name     = each.value
}

resource "aws_iam_user_login_profile" "users" {
  for_each                = aws_iam_user.users
  user                    = each.value.id
  password_length         = 16
  password_reset_required = true

  lifecycle {
    ignore_changes = [
      password_length,
      password_reset_required,
      pgp_key
    ]
  }
}

output "user_passwords" {
  value = { for username, user_props in aws_iam_user_login_profile.users : username => user_props.password }
}

output "users_from_yaml" {
  value = local.users_from_yaml
}
