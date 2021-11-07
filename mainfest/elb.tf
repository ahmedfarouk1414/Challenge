resource "aws_elb" "my-elb" {
  name            = "my-elb"
  subnets         = [aws_subnet.main-public-1.id]
  security_groups = [aws_security_group.elb-securitygroup.id]
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }


  instances                   = [aws_instance.example.id]
  idle_timeout                = 400
  cross_zone_load_balancing   = true
  connection_draining         = true
  connection_draining_timeout = 400
  tags = {
    Name = "my-elb"
  }
}



# Forward action

resource "aws_lb_listener_rule" "host_backend" {
  listener_arn =  aws_elb.my-elb.arn
  priority     = 99

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.backend.arn
  }

  condition {
    host_header {
      values = ["backend.jumia.com"]
    }
  }
}





# Forward action

resource "aws_lb_listener_rule" "host_front" {
  listener_arn =  aws_elb.my-elb.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front.arn
  }

  condition {
    host_header {
      values = ["front.jumia.com"]
    }
  }
}
