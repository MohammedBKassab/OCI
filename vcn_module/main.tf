resource "oci_core_vcn" "VCN" {
  compartment_id = var.compartment_id
  cidr_blocks    = [var.vcn_cidr]
  display_name   = var.vcn_display_name
}
 
resource "oci_core_internet_gateway" "IGW" {
  compartment_id = var.compartment_id
  display_name   = var.igw_display_name
  vcn_id         = oci_core_vcn.VCN.id
}



resource "oci_core_nat_gateway" "NATGW" {
  compartment_id = var.compartment_id
  vcn_id         = var.vpc_id
  display_name   = var.natgw_display_name
}

data "oci_core_services" "wind_services" {
}

resource "oci_core_service_gateway" "service_gateway" {
  
    compartment_id = var.compartment_id
    services {
        
        service_id = data.oci_core_services.wind_services.services.0.id
    }
    vcn_id = oci_core_vcn.VCN.id
}





