# README for Azure Vnet and Sub Net  #
This module is helpful for creating Resource Group Vnet and Subnet in Azure. This module utilize most of the variables defined in readme for this git repository.

* it will create single Resource Group.this will then contains Vnet and multiple Subnets 
* subnets can be on high level defined in three categories i.e. 

Subnet Type	| Important Note
----------------|---------------
public		|Ideal for resources available in **public domain**
private app 	|**Computational** resources which we dont want to expose in public will present here.
private db	|**Persistance layer** resources will reside here.

## Naming Convention for Resource Group ##
rg-<location_id>-<environment>-<cost_centre>-<vnet_seq_id>

## Naming Convention for VNet ##
vnet-<location_id>-<environment>-<cost_centre>-<vnet_seq_id>

## Naming Convention ##

Subnet Type	| Name
----------------|---------------
public		|sub-<location_id>-<environment>-<cost_centre>-<vnet_seq_id>-VNet<vnet_seq_id>-**pub**-<incremental-number>-<seq_id>
private app 	|sub-<location_id>-<environment>-<cost_centre>-<vnet_seq_id>-VNet<vnet_seq_id>-**privApp**-<incremental-number>-<seq_id>
private db	|sub-<location_id>-<environment>-<cost_centre>-<vnet_seq_id>-VNet<vnet_seq_id>-**privDb**-<incremental-number>-<seq_id>









