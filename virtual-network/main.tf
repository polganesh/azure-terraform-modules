/**
Module Name :- Azure virtual network
Description	:- General Purpose Virtual Network
Author :- Ganesh Pol
**/

resource "azurerm_resource_group" "main" {
	name	=	"rg-${var.location_id}-${var.environment}-${var.cost_centre}-${var.seq_id}"
	location=	"${var.location}"
	
	tags {
		Name		=	"rg-${var.location_id}-${var.environment}-${var.cost_centre}-${var.project}-${var.seq_id}"
    		Environment 	= 	"${var.environment}"
		LocationId	=	"${var.location_id}"
		Location	=	"${var.location}"
		CostCentre	=	"${var.cost_centre}"
		VersionId	=	"${var.version_id}"
		BuildDate	=	"${var.build_date}"
		MaintenanceDay	=	"${var.maintenance_day}"
		MaintenanceTime	=	"${var.maintenance_time}"
		SeqId		=	"${var.seq_id}"
	}
}

resource "azurerm_virtual_network" "main" {
	name			=	"vnet-${var.location_id}-${var.environment}-${var.cost_centre}-${var.vnet_seq_id}"
	location		=	"${var.location}"
	address_space       	= 	"${var.vnet_cidr_list}"
  	resource_group_name	= 	"${azurerm_resource_group.main.name}"
	tags {
		Name		=	"vnet-${var.location_id}-${var.environment}-${var.cost_centre}-${var.vnet_seq_id}"
    		Environment 	= 	"${var.environment}"
		LocationId	=	"${var.location_id}"
		Location	=	"${var.location}"
		CostCentre	=	"${var.cost_centre}"
		VersionId	=	"${var.version_id}"
		BuildDate	=	"${var.build_date}"
		MaintenanceDay	=	"${var.maintenance_day}"
		MaintenanceTime	=	"${var.maintenance_time}"
		SeqId		=	"${var.seq_id}"
	}
}

resource "azurerm_subnet" "public" {
	virtual_network_name	= 	"${azurerm_virtual_network.main.name}"
  	resource_group_name	= 	"${azurerm_resource_group.main.name}"
	count			=	"${length(var.public_subnet_cidr_list)}"
	name			=	"sub-${var.location_id}-${var.environment}-${var.cost_centre}-VNet${var.vnet_seq_id}-pub-${count.index+1}-${var.seq_id}"
	address_prefix		=	"${element(var.public_subnet_cidr_list, count.index)}"
	service_endpoints	=	"${var.public_service_endpoint_list}"
}


resource "azurerm_subnet" "privateApp" {
	virtual_network_name	= 	"${azurerm_virtual_network.main.name}"
  	resource_group_name	= 	"${azurerm_resource_group.main.name}"
	count			=	"${length(var.private_app_subnet_cidr_list)}"
	name			=	"sub-${var.location_id}-${var.environment}-${var.cost_centre}-VNet${var.vnet_seq_id}-privApp-${count.index+1}-${var.seq_id}"
	address_prefix		=	"${element(var.private_app_subnet_cidr_list, count.index)}"
	service_endpoints	=	"${var.private_app_service_endpoint_list}"
}


resource "azurerm_subnet" "privateDb" {
	virtual_network_name	= 	"${azurerm_virtual_network.main.name}"
  	resource_group_name	= 	"${azurerm_resource_group.main.name}"
	count			=	"${length(var.private_db_subnet_cidr_list)}"
	name			=	"sub-${var.location_id}-${var.environment}-${var.cost_centre}-VNet${var.vnet_seq_id}-privDb-${count.index+1}-${var.seq_id}"
	address_prefix		=	"${element(var.private_db_subnet_cidr_list, count.index)}"
	service_endpoints	=	"${var.private_db_service_endpoint_list}"
}


