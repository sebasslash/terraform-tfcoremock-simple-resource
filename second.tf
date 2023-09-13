resource "tfcoremock_simple_resource" "second" {
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
