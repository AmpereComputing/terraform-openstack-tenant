# Create OpenStack users in tenant project
resource "openstack_identity_user_v3" "user_1" {
  count = length(var.os_usernames)
  default_project_id = openstack_identity_project_v3.project_1.id
  name               = var.os_usernames[count.index]
  description        = var.os_user_description

  password = var.os_user_default_password

  ignore_change_password_upon_first_use = true

  multi_factor_auth_enabled = false

  multi_factor_auth_rule {
    rule = ["password", "totp"]
  }

  multi_factor_auth_rule {
    rule = ["password"]
  }

  extra = {
    email = var.os_user_email_addr[count.index]
  }
}
