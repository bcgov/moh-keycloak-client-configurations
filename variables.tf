# KEYCLOAK_DEV
variable "dev_client_id" {
  description = "The client_id for the Keycloak client"
  default     = "terraform"
}

variable "dev_client_secret" {
  description = "The client_secret for the Keycloak client"
}

variable "dev_keycloak_url" {
  description = "The URL of the Keycloak instance"
  default = "https://common-logon-dev.hlth.gov.bc.ca"
}

# KEYCLOAK_TEST
variable "test_client_id" {
  description = "The client_id for the Keycloak client in Master Realm"
  default     = "terraform"
}

variable "test_client_secret" {
  description = "The client_secret for the Keycloak client"
}

variable "test_keycloak_url" {
  description = "The URL of the Keycloak instance"
  default = "https://common-logon-test.hlth.gov.bc.ca"
}
