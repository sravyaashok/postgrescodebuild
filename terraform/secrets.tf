resource "random_password" "db_master_password" {
  length           = 16
  special          = false
}

resource "aws_secretsmanager_secret" "db_master_password" {
  name = var.db_master_password_secret
  tags = {
    Name = local.default_tags.Name
    component = local.default_tags.component
  }
}

resource "aws_secretsmanager_secret_version" "db_master_password_secret_version" {
  secret_id = aws_secretsmanager_secret.db_master_password.id
  secret_string = random_password.db_master_password.result
}

# resource "random_password" "db_tableau_user_password" {
#   length           = 16
#   special          = true
#   override_special = "_%@"
# }

# resource "aws_secretsmanager_secret" "db_tableau_user_password" {
#   name = var.db_tableau_user_password_secret
#   tags = {
#     Name = local.default_tags.Name
#     component = local.default_tags.component
#   }
# }

# resource "aws_secretsmanager_secret_version" "db_tableau_user_password_secret_version" { 
#   secret_id = aws_secretsmanager_secret.db_tableau_user_password.id
#   secret_string = random_password.db_tableau_user_password.result
# }
