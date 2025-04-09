output "ubuntu_latest" {
    value = data.oci_core_images.ubuntu_latest
}

output "private_ips" {
  value = {
    for name, inst in oci_core_instance.instances : name => inst.private_ip
  }
}


