/**
Module Name :- Azure virtual network
Description	:- General Purpose Virtual Network
Author :- Ganesh Pol
**/

data "azurerm_resource_group" "main" {
   filter {
    name   = "tag:Name"
    values = ["*-${var.location_id}-${var.environment}-${var.cost_centre}-${var.project}-${var.seq_id}"]
  }
}

resource "azure_virtual_network" "main" {
	name			="vnet-${var.location_id}-${var.environment}-${var.cost_centre}-${var.project}-${var.seq_id}"
	location		="${var.location}"
	address_space       	= ["${var.vnet_cidr}"]
  	resource_group_name	="${data.azurerm_resource_group.main.name}"
	tags {
		Name		=	"vnet-${var.location_id}-${var.environment}-${var.cost_centre}-${var.project}-${var.seq_id}"
    		Environment 	= 	"${var.environment}"
		LocationId	=	"${var.location_id}"
		Location	=	"${var.location}"
		CostCentre	=	"${var.cost_centre}"
		Project		=	"${var.project}"
		VersionId	=	"${var.version_id}"
		BuildDate	=	"${var.build_date}"
		MaintenanceDay	=	"${var.maintenance_day}"
		MaintenanceTime	=	"${var.maintenance_time}"
		SeqId		=	"${var.seq_id}"
	}
}

resource "azurerm_subnet" "public" {
	virtual_network_name	= 	"${azurerm_virtual_network.main.name}"
  	resource_group_name	= 	"${data.azurerm_resource_group.main.name}"
	count			=	"${length(var.public_subnet_cidr_list)}"
	name			=	"sub-${var.location_id}-${var.environment}-${var.cost_centre}-VNet${var.vnet_seq_id}-pub-${count.index}-${var.seq_id}"
	address_prefix		=	"${element(var.public_subnet_cidr_list, count.index)}"
	tags {
		Name		=	"sub-${var.location_id}-${var.environment}-${var.cost_centre}-VNet${var.vnet_seq_id}-pub-${count.index}-${var.seq_id}"
    		Environment 	= 	"${var.environment}"
		LocationId	=	"${var.location_id}"
		Location	=	"${var.location}"
		CostCentre	=	"${var.cost_centre}"
		Project		=	"${var.project}"
		VersionId	=	"${var.version_id}"
		BuildDate	=	"${var.build_date}"
		MaintenanceDay	=	"${var.maintenance_day}"
		MaintenanceTime	=	"${var.maintenance_time}"
		SeqId		=	"${var.seq_id}"
		VnetSeqId	=	"${var.vnet_seq_id}"
	}
}

