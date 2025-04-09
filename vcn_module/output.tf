output "vcn_id" {
    value = oci_core_vcn.VCN.id
}

output "igw_id" {
    value = oci_core_internet_gateway.IGW.id
}

output "rt_id" {
    value = oci_core_route_table.RT.id
}

output "pub_RT_id" {
    value = oci_core_route_table.pub_RT.id
}

output "priv_RT_id" {
    value = oci_core_route_table.priv_RT.id
}