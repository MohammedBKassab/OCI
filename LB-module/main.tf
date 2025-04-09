resource "oci_load_balancer_listener" "lb_listener" {
  default_backend_set_name = oci_load_balancer_backend_set.lb_backend_set.name
  load_balancer_id         = oci_load_balancer.public_lb.id
  name                     = var.listner_display_name
  port                     = var.port
  protocol                 = var.protocol
}

resource "oci_load_balancer" "public_lb" {
  compartment_id = var.compartment_id
  display_name   = var.display_name
  shape          = "100Mbps"
  subnet_ids     = var.subnet_ids
  is_private     = false
}

resource "oci_load_balancer_backend_set" "lb_backend_set" {
  load_balancer_id = oci_load_balancer.public_lb.id
  name             = var.backendset_display_name
  policy           = var.policy

  
  health_checker {
    protocol = var.protocol
    port     = var.port
    url_path = "/"
  }
}

resource "oci_load_balancer_backend" "lb_backend" {
  load_balancer_id = oci_load_balancer.public_lb.id
  for_each = var.backend_ips
  backendset_name  = oci_load_balancer_backend_set.lb_backend_set.name
  ip_address       = each.value.ip_address
  port             = var.port
}