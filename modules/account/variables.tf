variable "roles" {
  type = map(string)
  default = {
    "manage-consent"       = "manage-consent",
    "view-applications"    = "view-applications",
    "delete-account"       = "delete-account",
    "manage-account-links" = "manage-account-links",
    "view-profile"         = "view-profile",
    "manage-account"       = "manage-account",
    "view-consent"         = "view-consent",
  }
}