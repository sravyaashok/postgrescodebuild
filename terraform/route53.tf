# data "aws_route53_zone" "internal_hosted_zone" {
#   name         = "${var.vpn_zone_name}.us.i19.c01.johndeerecloud.com"
#   private_zone = true
# }

# resource "aws_route53_record" "database" {
#   zone_id = data.aws_route53_zone.internal_hosted_zone.zone_id
#   name = var.db_instance_identifier
#   type = "CNAME"
#   ttl = "300"
#   records = [aws_db_instance.default.address]
# }