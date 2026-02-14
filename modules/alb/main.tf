# Application Load Balancer
resource "aws_lb" "this" {
  name               = "${var.environment}-${var.name}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = var.subnet_ids

  enable_deletion_protection = false
  idle_timeout               = 60

  tags = merge(var.tags, {
    Name = "${var.environment}-${var.name}-alb"
  })
}

# Target Group
resource "aws_lb_target_group" "this" {
  name        = "${var.environment}-${var.name}-tg"
  port        = var.container_port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    enabled             = true
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    path                = var.health_check_path
    matcher             = "200"
  }

  tags = merge(var.tags, {
    Name = "${var.environment}-${var.name}-tg"
  })

  depends_on = [aws_lb.this]
}

# HTTP Listener
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

# HTTPS Listener (optional)
resource "aws_lb_listener" "https" {
  count             = var.certificate_arn != null ? 1 : 0
  load_balancer_arn = aws_lb.this.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}