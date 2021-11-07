resource "aws_lb_target_group" "front" {
  name     = "target-group-front"
  port     = 8081
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.main.id}"
}


resource "aws_lb_target_group" "backend" {
  name     = "target-group-backend"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.main.id}"
}

