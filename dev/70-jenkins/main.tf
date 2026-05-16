module "jenkins_vm" {
  source = "../../../terraform-azure-module/jenkins-vm"

  name                = "jenkins-dev"
  resource_group_name = data.terraform_remote_state.network.outputs.rg_name
  location            = data.terraform_remote_state.network.outputs.location

  subnet_id = data.terraform_remote_state.network.outputs.subnet_ids["app"]

  admin_username = var.admin_username

  custom_data = base64encode(
    templatefile("${path.module}/jenkins-init.sh", {
      private_key = file("~/.ssh/roboshop-azure")
    })
  )

  ssh_public_key = file("~/.ssh/roboshop-azure.pub")

  vm_size = "Standard_D2s_v3"

  tags = {
    Environment = "dev"
    Project     = "roboshop"
  }
}
