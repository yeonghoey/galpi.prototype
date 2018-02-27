data "template_file" "zappa_settings" {
  template = "${file("zappa_settings.template.json")}"

  vars {
    bucket = "${aws_s3_bucket.main.id}"
    certificate = "${aws_acm_certificate.main.arn}"
    domain = "${var.domain}"
    region = "${var.region}"
  }
}

output "zappa_settings" {
  value = "${data.template_file.zappa_settings.rendered}"
}
