resource "azurerm_resource_group" "main" {
	name	=	"rm-${var.location_id}-${var.environment}-${var.cost_centre}-${var.project}-${var.resource_group_seq_id}"
	location=	"${var.location}"
	
	tags {
		Name		=	"rm-${var.location_id}-${var.environment}-${var.cost_centre}-${var.resource_group_seq_id}"
    		Environment 	= 	"${var.environment}"
		LocationId	=	"${var.location_id}"
		Location	=	"${var.location}"
		CostCentre	=	"${var.cost_centre}"
		Project		=	"${var.project}"
		VersionId	=	"${var.version_id}"
		BuildDate	=	"${var.build_date}"
		MaintenanceDay	=	"${var.maintenance_day}"
		MaintenanceTime	=	"${var.maintenance_time}"
		ResGroupSeqId	=	"${var.resource_group_seq_id}"
	}
}

