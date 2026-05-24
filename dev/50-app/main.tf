module "vmss" {

  source = "../../../terraform-azure-module/vmss"

  resource_group_name = data.terraform_remote_state.network.outputs.rg_name

  location = data.terraform_remote_state.network.outputs.location

  admin_username = var.admin_username

  ssh_public_key = file(var.ssh_public_key)

  health_probe_ids = data.terraform_remote_state.appgw.outputs.probe_ids

  # -------------------------------------------------
  # ONLY FRONTEND ATTACHED TO PUBLIC APPGW
  # -------------------------------------------------

    backend_pool_map = {

      frontend = [
        data.terraform_remote_state.appgw.outputs.frontend_backend_pool_id
      ]

      catalogue = [
        data.terraform_remote_state.internal_appgw.outputs.backend_pool_ids["catalogue"]
      ]

      user = [
        data.terraform_remote_state.internal_appgw.outputs.backend_pool_ids["user"]
      ]

      cart = [
        data.terraform_remote_state.internal_appgw.outputs.backend_pool_ids["cart"]
      ]

      shipping = [
        data.terraform_remote_state.internal_appgw.outputs.backend_pool_ids["shipping"]
      ]

      payment = [
        data.terraform_remote_state.internal_appgw.outputs.backend_pool_ids["payment"]
      ]
    }

  # -------------------------------------------------
  # VMSS DEFINITIONS
  # -------------------------------------------------

  vmss_map = {

    frontend = {

      subnet_id = data.terraform_remote_state.network.outputs.subnet_ids["app"]

      vm_size = "Standard_D2s_v3"

      instances = 1

      image_id = "/subscriptions/dfde553b-a665-4f1c-b4d2-9779ea084029/resourceGroups/roboshop-images-rg/providers/Microsoft.Compute/images/frontend-image"
    }

    catalogue = {

      subnet_id = data.terraform_remote_state.network.outputs.subnet_ids["app"]

      vm_size = "Standard_D2s_v3"

      instances = 1

      image_id = "/subscriptions/dfde553b-a665-4f1c-b4d2-9779ea084029/resourceGroups/roboshop-images-rg/providers/Microsoft.Compute/images/catalogue-image"
    }

    user = {

      subnet_id = data.terraform_remote_state.network.outputs.subnet_ids["app"]

      vm_size = "Standard_D2s_v3"

      instances = 1

      image_id = "/subscriptions/dfde553b-a665-4f1c-b4d2-9779ea084029/resourceGroups/roboshop-images-rg/providers/Microsoft.Compute/images/user-image"
    }

    cart = {

      subnet_id = data.terraform_remote_state.network.outputs.subnet_ids["app"]

      vm_size = "Standard_D2s_v3"

      instances = 1

      image_id = "/subscriptions/dfde553b-a665-4f1c-b4d2-9779ea084029/resourceGroups/roboshop-images-rg/providers/Microsoft.Compute/images/cart-image"
    }

    shipping = {

      subnet_id = data.terraform_remote_state.network.outputs.subnet_ids["app"]

      vm_size = "Standard_D2s_v3"

      instances = 1

      image_id = "/subscriptions/dfde553b-a665-4f1c-b4d2-9779ea084029/resourceGroups/roboshop-images-rg/providers/Microsoft.Compute/images/shipping-image"
    }

    payment = {

      subnet_id = data.terraform_remote_state.network.outputs.subnet_ids["app"]

      vm_size = "Standard_D2s_v3"

      instances = 1

      image_id = "/subscriptions/dfde553b-a665-4f1c-b4d2-9779ea084029/resourceGroups/roboshop-images-rg/providers/Microsoft.Compute/images/payment-image"
    }
  }

  tags = {

    Environment = "dev"

    Project = "roboshop"
  }
}