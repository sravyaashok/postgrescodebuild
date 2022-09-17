resource "aws_kms_key" "aws-tableau-postgres-db-key" {
  description = "The key for encrypting aws-tableau-postgres-db rds instance"
  enable_key_rotation = true

  tags = {
    Name = local.default_tags.Name
    component = local.default_tags.component
  }
}

resource "aws_kms_alias" "aws-tableau-postgres-db-key" {
  name = "alias/aws-tableau-postgres-db-key"
  target_key_id = aws_kms_key.aws-tableau-postgres-db-key.key_id
}