variable "input" {
  type    = number
  default = 0

  validation {
    condition     = var.input >= 0
    error_message = "input should be positive"
  }
}
