locals {
  #Tags
  tags     = merge(var.tags, { tf-module-name = "alb" }, { env = var.env })
  sg_name  = var.internal ? "${var.env}-alb-internal-sg" : "${var.env}-alb-public-sg" # No need of this
  alb_name = var.internal ? "${var.env}-alb-internal" : "${var.env}-alb-public"
}

