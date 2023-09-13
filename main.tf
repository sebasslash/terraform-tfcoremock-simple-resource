# sample_two.tf
resource "tfcoremock_simple_resource" "resource" {
  number = var.input + 1

  lifecycle {

    precondition {
      condition     = var.input % 2 == 0
      error_message = "input should be even"
    }

    postcondition {
      condition     = self.number % 2 == 1
      error_message = "output should be odd"
    }

  }
}

output "value" {
  value = tfcoremock_simple_resource.resource.number

  precondition {
    condition     = tfcoremock_simple_resource.resource.number >= 5
    error_message = "value should be greater than or equal to 5"
  }
}
