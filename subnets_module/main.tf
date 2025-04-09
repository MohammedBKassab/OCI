######################
#ROUTE TABLES
######################

resource "oci_core_route_table" "priv_RT" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.VCN.id
  display_name   = var.rt_display_name
  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.NATGW.id
  }
}

resource "oci_core_route_table" "pub_RT" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.VCN.id
  display_name   = var.rt_display_name
  route_rules {
    
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.IGW.id
  }
}

#################
#SUBNETS
################

resource "oci_core_subnet" "public_subnet1" {
  compartment_id    = var.compartment_id
  vcn_id            = var.vcn_id
  cidr_block        = cidrsubnet(var.vcn_cidr, 8, 1)
  display_name      = var.display_name[0]
  route_table_id    = oci_core_route_table.pub_RT.id
  prohibit_public_ip_on_vnic = false
}

resource "oci_core_subnet" "public_subnet2" {
  compartment_id    = var.compartment_id
  vcn_id            = var.vcn_id
  cidr_block        = cidrsubnet(var.vcn_cidr, 8, 2)
  display_name      = var.display_name[1]
  route_table_id    = oci_core_route_table.pub_RT.id
  prohibit_public_ip_on_vnic = false
}

resource "oci_core_subnet" "private_subnet1" {
  compartment_id    = var.compartment_id
  vcn_id            = var.vcn_id
  cidr_block        = cidrsubnet(var.vcn_cidr, 8, 3)
  display_name      = var.display_name[2]
  route_table_id    = oci_core_route_table.priv_RT.id
  prohibit_public_ip_on_vnic = true
}

resource "oci_core_subnet" "private_subnet2" {
  compartment_id    = var.compartment_id
  vcn_id            = var.vcn_id
  cidr_block        = cidrsubnet(var.vcn_cidr, 8, 4)
  display_name      = var.display_name[3]
  route_table_id    = oci_core_route_table.priv_RT.id
  prohibit_public_ip_on_vnic = true
}