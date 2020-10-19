# Create OpenStack Project
resource "openstack_identity_project_v3" "project_1" {
  name        = "var.os_project_name"
  description = "var.os_project_description"
}

data "openstack_identity_project_v3" "project_1" {
  name = openstack_identitity_project_v3.project_1.name
}

resource "openstack_compute_quotaset_v2" "quotaset_1" {
  project_id           = openstack_identity_project_v3.project_1.id
  key_pairs            = 10
  ram                  = 96000
  cores                = 40 
  instances            = 40
  server_groups        = 4
  server_group_members = 8
}
