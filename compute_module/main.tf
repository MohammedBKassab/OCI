#usually we get the image ID for OCI Images
data "oci_core_images" "ubuntu_latest" {
  compartment_id = var.compartment_ocid
  operating_system = "Canonical Ubuntu"
  sort_by = "TIMECREATED"
  sort_order = "DESC"
  filter {
    name = "display_name"
    regex = true
    values = ["^Canonical-Ubuntu-.*"]
  }
}


resource "oci_core_instance" "instances" {
  for_each = toset(var.instances_name)

  compartment_id      = var.compartment_id
  display_name        = each.value
  shape               = var.shape
  availability_domain = var.availability_domain

  source_details {
    source_type = "image"
    source_id   = oci_core_images.ubuntu_latest.images.0.id
  }

  create_vnic_details {
    subnet_id = var.subnet_id
  }
}
