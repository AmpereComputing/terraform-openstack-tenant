# Create OpenStack Project
resource "openstack_identity_project_v3" "project_1" {
  name        = var.os_project_name
  description = var.os_project_description
}

#data "openstack_identity_project_v3" "project_1" {
#  name = openstack_identitity_project_v3.project_1.name
#}
locals {
    openstack_member_role_id = data.openstack_identity_role_v3.member.id
    openstack_admin_role_id = data.openstack_identity_role_v3.admin.id
    openstack_reader_role_id = data.openstack_identity_role_v3.reader.id
}

output "local_openstack_member_role_id" {
  value = local.openstack_member_role_id
}
output "local_openstack_admin_role_id" {
  value = local.openstack_admin_role_id
}
output "local_openstack_reader_role_id" {
  value = local.openstack_reader_role_id
}
