resource "aws_launch_template" "example" {
  name_prefix = "example"
 image_id = "${data.aws_ami.image.id}"
 instance_type = "${var.instance_type}"
}

resource "aws_autoscaling_group" "example" {
  availability_zones = [
    "${var.region}a",
    "${var.region}b",
    "${var.region}c",
  ]

  desired_capacity = "${var.desired_capacity}"

  max_size = "${var.max_size}"

  min_size = "${var.min_size}"

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = "${aws_launch_template.example.id}"
      }

      override {
        instance_type = "${var.instance_type}"
        weighted_capacity = "3"
      }

      override {
        instance_type = "c3.large"
        weighted_capacity = "2"
      }
    }
  }
}
