# Create OpenStack Project
resource "openstack_identity_project_v3" "project_1" {
  name        = "var.os_project_name"
  description = "var.os_project_description"
}

#data "openstack_identity_project_v3" "project_1" {
#  name = openstack_identitity_project_v3.project_1.name
#}
