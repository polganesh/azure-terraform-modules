/**
Module Name :- Azure Route Table
Description	:- Route Table
Author :- Ganesh Pol
**/

data "azurerm_resource_group" "resource_group" {
	name="rg-${var.location_id}-${var.environment}-${var.cost_centre}-${var.seq_id}"
}

/**
name - (Required) The name of the route. Changing this forces a new resource to be created.

resource_group_name - (Required) The name of the resource group in which to create the route. Changing this forces a new resource to be created.

route_table_name - (Required) The name of the route table within which create the route. Changing this forces a new resource to be created.

address_prefix - (Required) The destination CIDR to which the route applies, such as 10.1.0.0/16

next_hop_type - (Required) The type of Azure hop the packet should be sent to. Possible values are VirtualNetworkGateway, VnetLocal, Internet, VirtualAppliance and None

next_hop_in_ip_address - (Optional) Contains the IP address packets should be forwarded to. Next hop values are only allowed in routes where the next hop type is VirtualAppliance.

route {
    name                   = "default"
    address_prefix         = "10.100.0.0/14"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.10.1.1"
  }


resource "azurerm_route" "test" {
  name                = "acceptanceTestRoute1"
  resource_group_name = "${azurerm_resource_group.test.name}"
  route_table_name    = "${azurerm_route_table.test.name}"
  address_prefix      = "10.1.0.0/16"
  next_hop_type       = "vnetlocal"
}
**/

resource "azurerm_route" "main" {
	name                          	= "route-${var.location_id}-${var.environment}-${var.cost_centre}-${var.seq_id}"
  	resource_group_name           	= "${data.azurerm_resource_group.resource_group.name}"
	route_table_name    		= "routetbl-${var.location_id}-${var.environment}-${var.cost_centre}-${var.seq_id}"
  	address_prefix      		= "${var.address_prefix_CIDR}"
  	next_hop_type       		= "${var.next_hop_type}"
	next_hop_in_ip_address		="${var.next_hop_in_ip_address}"
}


