module "azure_devops_agent_vm" {
  source = "../../../terraform-azure-module/azure-devops-agent-vm"

  name                = "azure-agent-dev"
  resource_group_name = data.terraform_remote_state.network.outputs.rg_name
  location            = data.terraform_remote_state.network.outputs.location

  subnet_id = data.terraform_remote_state.network.outputs.subnet_ids["app"]

  admin_username = var.admin_username

  ssh_public_key = file("/home/sameer/.ssh/roboshop-azure.pub")

  vm_size = "Standard_D2s_v3"

  tags = {
    Environment = "dev"
    Project     = "roboshop"
  }
}