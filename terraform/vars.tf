locals {
  default_tags = {
    Name      = "tableau-postgres-rds"
    component = "Tableau"
  }
}

variable "environment_name" {
  type = string
}

# variable "bucket_name" {
#   type = string
# }

variable "db_instance_class" {
  type = string
}

variable "db_version" {
  type = string
}

variable "db_instance_identifier" {
  type = string
}

variable "db_name" {
  type = string
}

variable "db_master_username" {
  type = string
}

variable "db_master_password_secret" {
  type = string
}

# variable "db_tableau_username" {
#   type = string
# }

# variable "db_tableau_user_password_secret" {
#   type = string
# }

# variable "vpn_zone_name" {
#   type = string
# }