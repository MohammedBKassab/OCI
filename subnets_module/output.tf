output "cidr_block-1" {
    value = oci_core_subnet.public_subnet1.cidr_block
}
 output "cidr_block-2" {
   value = oci_core_subnet.public_subnet2.cidr_block   
}
output "cidr_block-3" {
 value = oci_core_subnet.private_subnet1.cidr_block   
}
output "cidr_block-4" {
 value = oci_core_subnet.private_subnet2.cidr_block
}