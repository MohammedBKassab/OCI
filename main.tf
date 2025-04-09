
module "Instance" {
    source = "./modules/compute_module"
    comartment_id = var.compartment_id
    display_name = var.display_name
    shape = var.shape
    create_vnic_details {
        subnet_id = [module.Subnets.private_subnet1 , 
        module.Subnets.private_subnet2]
    }
}

module "LB" {
    source = "./modules/LB-module"
    comartment_id = var.compartment_id
    backend_ips = module.Instance.private_ips
    lb_display_name = var.lb_display_name
    listner_display_name = var.listner_display_name
    port = var.port
    protocol = var.protocol
    backendset_display_name = var.backendset_display_name
}


module "Subnets" {
    source = "./modules/subnets_module"
    comartment_id = var.compartment_id
    vcn_id = module.network.vcn_id
    display_name = var.display_name
    cidr = var.vcn_cidr
    rt_display_name = var.rt_display_name
}



module "network"{
    source = "./modules/vcn_module"
    comartment_id = var.compartment_id
    cidr = var.vcn_cidr
    display_name = var.vcn_display_name
    igw_display_name = var.igw_display_name
    NATGW_display_name = var.natgw_display_name
    rt_display_name = var.rt_display_name
}