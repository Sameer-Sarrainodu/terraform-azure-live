locals {

  backend_records = [

    "catalogue",

    "user",

    "cart",

    "shipping",

    "payment"
  ]
}

resource "aws_route53_record" "backend" {

  for_each = toset(local.backend_records)

  zone_id = var.zone_id

  name = "${each.key}.backend.${var.zone_name}"

  type = "A"

  ttl = 300

  records = [
    data.terraform_remote_state.internal_appgw.outputs.private_ip
  ]

  allow_overwrite = true
}