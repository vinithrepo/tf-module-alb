resource "aws_lb" "test" {
  name               = "${var.env}-alb"
  internal           = var.internal
  load_balancer_type = var.lb_type
  security_groups    =
  subnets            = [for subnet in aws_subnet.public : subnet.id]

  enable_deletion_protection = true

  access_logs {
    bucket  = aws_s3_bucket.lb_logs.id
    prefix  = "test-lb"
    enabled = true
  }

  tags = {
    Environment = "production"
  }
}