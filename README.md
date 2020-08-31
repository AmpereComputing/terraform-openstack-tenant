![Ampere Computing](https://avatars2.githubusercontent.com/u/34519842?s=400&u=1d29afaac44f477cbb0226139ec83f73faefe154&v=4)

# terraform-openstack-tenant

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## Description

This Terraform module will configure the basic OpenStack Project, Role, Role Assignment to create an OpenStack tenant with named users.


## Usage

```

module "openstack_tenant" {
  source = "github.com/amperecomputing/terraform-openstack-tenant"
  os_project_name = "QA"
  os_usernames = ["bwayne","ckent"]
  os_user_password = "ChangeMe"
  os_user_email_addr = ["bwayne@example.com","ckent@example.com"]
}

```
