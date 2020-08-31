variable "os_project_name" {
  description = "OpenStack Project Name"
  type = string
}

variable "os_project_description" {
  description = "OpenStack Project description"
  type = string
  default = "OpenStack Project: ${var.os_project_name}"
}

variable "os_role_name" {
  description = "OpenStack Role Name"
  type = string
  default = "${var.os_project_name}_Admins"
}

variable "os_usernames" {
  description = "OpenStack Username"
  type = string
  default = ["user1","user2"]
}

variable "os_user_description" {
  description = "OpenStack user description"
  type = string
  default = "OpenStack User: ${var.os_usernames[count.index]}(${var.os_user_email_addr[count.index]})"
}

variable "os_user_default_password" {
  description = "OpenStack User Password"
  type = string
}

variable "os_user_email_addr" {
  description = "OpenStack User email address"
  type = string
  default = ["user1@example.com","user2@example.com"]
}
