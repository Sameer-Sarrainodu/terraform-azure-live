resource "azurerm_role_assignment" "packer_contributor" {

  scope = data.terraform_remote_state.network.outputs.rg_id

  role_definition_name = "Contributor"

  principal_id = var.packer_sp_object_id
}