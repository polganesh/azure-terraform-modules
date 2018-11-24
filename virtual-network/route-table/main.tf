/**
Module Name :- Azure Route Table
Description	:- Route Table
Author :- Ganesh Pol
**/

data "azurerm_resource_group" "resource_group" {
	name="rg-${var.location_id}-${var.environment}-${var.cost_centre}-${var.seq_id}"
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

resource "azurerm_subnet_route_table_association" "test" {
  subnet_id      = "${var.subnetid}"
  route_table_id = "${azurerm_route_table.main.id}"
}


resource "azurerm_route" "main" {
	count			=	"${length(var.route_address_prefix_CIDR_list)}"
	name                          	= "route-${var.location_id}-${var.environment}-${var.cost_centre}-${var.seq_id}-${count.index+1}"
  	resource_group_name           	= "${data.azurerm_resource_group.resource_group.name}"
	route_table_name    		= "${azurerm_route_table.main.name}"
	address_prefix      		= "${element(var.route_address_prefix_CIDR_list, count.index)}"
	next_hop_type       		= "${element(var.next_hop_type_list, count.index)}"
	next_hop_in_ip_address		="${element(var.next_hop_in_ip_address_list, count.index)}"
}



