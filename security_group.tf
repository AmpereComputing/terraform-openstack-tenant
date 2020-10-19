# Depreciated OpenStack Resource
# https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/compute_secgroup_v2
## Create security group for tenant
#resource "openstack_compute_secgroup_v2" "secgroup_1" {
#  name        = "${var.os_project_name}_security_group"
#  description = "${var.os_project_name} security group"
## SSH Port
#  rule {
#    from_port   = 22
#    to_port     = 22
#    ip_protocol = "tcp"
#    cidr        = "0.0.0.0/0"
#  }
## HTTP Port
#  rule {
#    from_port   = 80
#    to_port     = 80
#    ip_protocol = "tcp"
#    cidr        = "0.0.0.0/0"
#  }
## HTTPS Port
#  rule {
#    from_port   = 443
#    to_port     = 443
#    ip_protocol = "tcp"
#    cidr        = "0.0.0.0/0"
#  }
## 8080 for K8S mgmt
#  rule {
#    from_port   = 8080
#    to_port     = 8080
#    ip_protocol = "tcp"
#    cidr        = "0.0.0.0/0"
#  }
## Allow ping
#  rule {
#    from_port   = -1
#    to_port     = -1
#    ip_protocol = "icmp"
#    cidr        = "0.0.0.0/0"
#  }
#
#}
data "openstack_identity_project_v3" "project_1" {
  name = "var.os_project_name"
}

data "openstack_networking_secgroup_v2" "project_1" {
  name = "${var.os_project_name} secgroup"
  tenant_id = "${openstack_identity_project_v3.project_1.id}"
}


resource "openstack_networking_secgroup_rule_v2" "secgroup_default_rule_ssh" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.project_1.id
}

resource "openstack_networking_secgroup_rule_v2" "secgroup_default_rule_http" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.project_1.id
}

resource "openstack_networking_secgroup_rule_v2" "secgroup_default_rule_https" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 443
  port_range_max    = 443
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.project_1.id
}

resource "openstack_networking_secgroup_rule_v2" "secgroup_default_rule_k8s" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 8080
  port_range_max    = 8080
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.project_1.id
}

resource "openstack_networking_secgroup_rule_v2" "secgroup_default_rule_icmp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  port_range_min    = -1
  port_range_max    = -1
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.project_1.id
}
