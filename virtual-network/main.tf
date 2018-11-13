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
	name	=	"vnet-${var.location_id}-${var.environment}-${var.cost_centre}-${var.project}-${var.seq_id}"
	location=	"${var.location}"
	address_space       = ["${var.address_space}"]
  	resource_group_name = "${data.azurerm_resource_group.main.name}"
  	
	
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
