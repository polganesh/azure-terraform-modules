/**
Module Name :- Azure Route Table
Description	:- Route Table
Author :- Ganesh Pol
**/

data "azurerm_resource_group" "resource_group" {
	filter {
    		name   = "tag:Name"
    		values = ["*-${var.location_id}-${var.environment}-${var.cost_centre}-${var.seq_id}"]
  	}
}

resource "azurerm_route_table" "main" {
	name                          = "routetbl-${var.location_id}-${var.environment}-${var.cost_centre}-${var.seq_id}"
  	location                      = "${var.location}"
  	resource_group_name           = "${data.azurerm_resource_group.resource_group.name}"
	tags {
		Name		=	"routetbl-${var.location_id}-${var.environment}-${var.cost_centre}-${var.seq_id}"
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


