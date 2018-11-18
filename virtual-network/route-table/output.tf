output "id"{
 value="{azurerm_route_table.main.id}"
}

output "subnets" {
  value = "${azurerm_route_table.main.subnets}"
}
