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

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.backend.arn
  target_id        = aws_instance.example.id
}


resource "aws_lb_target_group_attachment" "test2" {
  target_group_arn = aws_lb_target_group.front.arn
  target_id        = aws_instance.example.id
}

