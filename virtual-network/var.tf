variable "location_id"{
	description="indicates id associated with location"
	default="euNorth"
}

variable "location"{
	description="indicates Azure location. one can get list of location by using CLI command az account list-locations --output table"
	default="northeurope"
}

variable "environment"{
	description="indicates name of our environment. possible values dev,cit,sit,uat,pprod,prod,n"
	default="dev"
}

variable "cost_centre"{
	description="A part of an organization to which costs may be charged.e.g. finance/it/hr/wholesale/retail/investment etc..."
	default=""
}

variable "project"{
	description="Name of Project"
	default=""
}

variable "version_id"{
	description="version of this component.Everytime when we are updating this component we need to increment it."
	default="001"
}

variable "build_date"{
	description="date on which this component is built.format ddMMYYYY e.g. 2611218 indicates it is built on 26th Day of November month and year of 2018"
	default=""
}

variable "maintenance_day"{
	description="ideal day for performing maintenance activity e.g. sun,mon,tue,wed,thu,fri,sat"
	default=""
}

variable "maintenance_time"{
	description="ideal time for performing maintenance activity in HHmm format e.g. 1310 i.e. perform maintainance on 1:10 PM "
	default=""
}

variable "seq_id"{
	description="sequence id for resource group"
	default="001"
}

variable "vnet_seq_id"{
	description="sequence id for vnet"
	default="001"
}

variable "vnet_cidr" {
  description = "CIDR block for Virtual Network"
}


variable "public_subnet_cidr_list"{
	description="all public facing resources e.g. ALB will reside in this subnet"
	type="list"
}

variable public_service_endpoint_list{
	description=" The list of Service endpoints to associate with the subnet. Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql and Microsoft.Storage."
	type="list"
}


