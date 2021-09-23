# OpenStack Role Assignment
resource "openstack_identity_role_assignment_v3" "role_assignment_1" {
  count = length(var.os_usernames)
  user_id    = openstack_identity_user_v3.user_1[count.index].id
  project_id = openstack_identity_project_v3.project_1.id
  role_id    = openstack_identity_role_v3.member.id
}
