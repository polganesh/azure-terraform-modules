/**
Module Name :- Azure Kubernetes Service
Description	:- General Purpose Azure Kubernetes Service
Author :- Ganesh Pol
**/

data "azurerm_resource_group" "resource_group" {
	name="rg-${var.location_id}-${var.environment}-${var.cost_centre}-${var.seq_id}"
}

resource "azurerm_kubernetes_cluster" "test" {
  name                = "k8s-${var.location_id}-${var.environment}-${var.cost_centre}-${var.project}-${var.app_service}-${var.seq_id}"
  location            = "${var.location}"
  resource_group_name = "${data.azurerm_resource_group.resource_group.name}"
  dns_prefix          = "${var.dns_prefix}"

  agent_pool_profile {
	# Agent pool name can not be more than 12 char Agent Pool names must start with a lowercase letter, have max length of 12, and only have 		# characters a-z0-9.
    	name            =  "${var.environment}${var.cost_centre}${var.app_service}"
    	count           = "${var.agent_count}"
    	vm_size         = "${var.agent_vm_size}"
    	os_type         = "${var.agent_os_type}"
    	os_disk_size_gb = "${var.agent_os_disk_size_gb}"

	# Required for advanced networking
    	vnet_subnet_id = "${var.agent_subnet_id}"
  }

  service_principal {
    client_id     = "${var.service_principal_client_id}"
    client_secret = "${var.service_principal_client_secret}"
  }

	
 network_profile {
    network_plugin = "azure"
  }

  tags {
		Name		=	"k8s-${var.location_id}-${var.environment}-${var.cost_centre}-${var.project}-${var.app_service}-${var.seq_id}"
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
