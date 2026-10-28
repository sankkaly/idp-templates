# Zero-dependency smoke-test template: uses only Terraform's built-in terraform_data resource,
# so it needs no cloud credentials and downloads no providers.
terraform {
  required_version = ">= 1.5"
}

variable "message" {
  type    = string
  default = "hello from the IDP"
}

resource "terraform_data" "hello" {
  input = var.message
}

output "echo" {
  value = terraform_data.hello.output
}
