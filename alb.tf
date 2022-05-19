# target group
resource "aws_lb_target_group" "my_tg" {
  name     = "tf-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.network.vpc_id
}

# to attach ec2 to target gp
resource "aws_lb_target_group_attachment" "my_tg_attach" {
  target_group_arn = aws_lb_target_group.my_tg.arn
  target_id        = aws_instance.private1.id
  port             = 80
}

# Craete load balancer
resource "aws_lb" "my_alb" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = [module.network.public_subnet1, module.network.public_subnet2]

  tags = {
    Environment = "application"
  }
}

# Create listener: This will determine on which port and protocol that load balancer will listen
resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_tg.arn
  }
}