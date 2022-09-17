resource "aws_db_subnet_group" "postgres-sng" {
  name       = "postgres-dbsubnetgroup"
  subnet_ids = ["subnet-0a67becdbbe9637e9", "subnet-0b37c0d7e589d7eb4"]
  description = "DB subnet for postgres RDS instance"
  
  tags = {
    Name = local.default_tags.Name
    component = local.default_tags.component
  }
}

resource "aws_db_instance" "postgressdb" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = var.db_version
  instance_class       = var.db_instance_class
  identifier           = var.db_instance_identifier
  db_name                 = var.db_name
  username             = var.db_master_username
  password             = aws_secretsmanager_secret_version.db_master_password_secret_version.secret_string
  parameter_group_name = "default.postgres12"
  db_subnet_group_name = aws_db_subnet_group.postgres-sng.name
  copy_tags_to_snapshot = true
  kms_key_id           = aws_kms_key.aws-tableau-postgres-db-key.arn
  storage_encrypted    = true
  skip_final_snapshot  = true
  vpc_security_group_ids = ["sg-0cff2996189a91ef5"]
  final_snapshot_identifier = "${var.db_instance_identifier}-snapshot-final"
  allow_major_version_upgrade = false
  auto_minor_version_upgrade = true
  backup_retention_period = 14
  backup_window       = "23:00-23:30"
  maintenance_window  = "Sun:10:00-Sun:10:30"
  
  tags = {
    Name = local.default_tags.Name
    component = local.default_tags.component
  }
}