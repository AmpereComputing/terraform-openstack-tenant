# Create OpenStack Role
# resource "openstack_identity_role_v3" "role_1" {
# name = var.os_role_name
#}
# Create OpenStack Global Roles
data "openstack_identity_role_v3" "member" {
  name = "member"
}
data "openstack_identity_role_v3" "admin" {
  name = "admin"
}

data "openstack_identity_role_v3" "reader" {
  name = "reader"
}
