module "network" {
  source                = "github.com/OT-terraform-azure-modules/terraform-azure-network-skeleton?ref=v1.0.0"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  vnets                 = var.vnets
  subnets               = var.subnets
  nsgs                  = var.nsgs
  nsg_rules             = var.nsg_rules
  nsg_associations      = var.nsg_associations
}
