module "internal_appgw" {

  source = "../../../terraform-azure-module/internal-appgw"

  name = "internal-appgw-dev"

  location = data.terraform_remote_state.network.outputs.location

  resource_group_name = data.terraform_remote_state.network.outputs.rg_name

  subnet_id = data.terraform_remote_state.network.outputs.subnet_ids["appgw"]

  private_ip = "10.0.5.20"

  backend_map = {

    catalogue = {

      backend_pool_name = "catalogue-pool"

      backend_http_name = "catalogue-http"

      probe_name = "catalogue-probe"

      host_name = "catalogue.backend.sharkdev.shop"

      port = 8080
    }

    user = {

      backend_pool_name = "user-pool"

      backend_http_name = "user-http"

      probe_name = "user-probe"

      host_name = "user.backend.sharkdev.shop"

      port = 8080
    }

    cart = {

      backend_pool_name = "cart-pool"

      backend_http_name = "cart-http"

      probe_name = "cart-probe"

      host_name = "cart.backend.sharkdev.shop"

      port = 8080
    }

    shipping = {

      backend_pool_name = "shipping-pool"

      backend_http_name = "shipping-http"

      probe_name = "shipping-probe"

      host_name = "shipping.backend.sharkdev.shop"

      port = 8080
    }

    payment = {

      backend_pool_name = "payment-pool"

      backend_http_name = "payment-http"

      probe_name = "payment-probe"

      host_name = "payment.backend.sharkdev.shop"

      port = 8080
    }
  }

  tags = {

    Environment = "dev"

    Project = "roboshop"
  }
}