resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = "300"
  access_type                         = "PUBLIC"
  backchannel_logout_session_required = false
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "PIDP-WEBAPP"
  consent_required                    = false
  description                         = "Provider Identity Portal"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = ""
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "http://localhost:*",
    "https://pr-81.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-158.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-159.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-160.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-161.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-162.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-163.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-164.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-165.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-166.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-167.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-168.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-169.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-170.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-171.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-172.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-173.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-174.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-175.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-176.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-177.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-178.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-179.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-180.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-181.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-182.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-183.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-184.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-185.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-186.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-187.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-188.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-189.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-190.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-191.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-192.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-193.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-194.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-195.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-196.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-197.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-198.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-199.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-200.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-201.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-202.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-203.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-204.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-205.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-206.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-207.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-208.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-209.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-210.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-211.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-212.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-213.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-214.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-215.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-216.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-217.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-218.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-219.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-220.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-221.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-222.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-223.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-224.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-225.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-226.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-227.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-228.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-229.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-230.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-231.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-232.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-233.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-234.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-235.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-236.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-237.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-238.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-239.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-240.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-241.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-242.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-243.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-244.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-245.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-246.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-247.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-248.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-249.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-250.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-251.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-252.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-253.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-254.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-255.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-256.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-257.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-258.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-259.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-260.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-261.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-262.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-263.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-264.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-265.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-266.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-267.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-268.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-269.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-270.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-271.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-272.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-273.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-274.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-275.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-276.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-277.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-278.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-279.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-280.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-281.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-282.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-283.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-284.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-285.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-286.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-287.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-288.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-289.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-290.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-291.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-292.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-293.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-294.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-295.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-296.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-297.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-298.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-299.healthprovideridentityportal.gov.bc.ca/",
    "https://pr-300.healthprovideridentityportal.gov.bc.ca/",
    "https://dev.healthprovideridentityportal.gov.bc.ca/*",
    "https://dev.healthprovideridentityportal.gov.bc.ca",
  ]
  web_origins = [
    "*",
  ]
}
resource "keycloak_openid_audience_protocol_mapper" "PIDP-SERVICE-aud-mapper" {
  add_to_id_token          = false
  client_id                = keycloak_openid_client.CLIENT.id
  included_client_audience = "PIDP-SERVICE"
  name                     = "PIDP-SERVICE aud mapper"
  realm_id                 = keycloak_openid_client.CLIENT.realm_id
}
resource "keycloak_openid_user_attribute_protocol_mapper" "given_names" {
  add_to_id_token = true
  add_to_userinfo = true
  claim_name      = "given_names"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "given_names"
  user_attribute  = "given_names"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}
resource "keycloak_openid_user_session_note_protocol_mapper" "identity_provider" {
  add_to_id_token  = false
  claim_name       = "identity_provider"
  claim_value_type = "String"
  client_id        = keycloak_openid_client.CLIENT.id
  name             = "identity_provider"
  realm_id         = keycloak_openid_client.CLIENT.realm_id
  session_note     = "identity_provider"
}
module "scope-mappings" {
  source    = "../../../../modules/scope-mappings"
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  roles = {
    "PIDP-SERVICE/ADMIN"             = var.PIDP-SERVICE.ROLES["ADMIN"].id,
    "PIDP-SERVICE/USER"              = var.PIDP-SERVICE.ROLES["USER"].id,
    "PIDP-SERVICE/feature_amh_demo"  = var.PIDP-SERVICE.ROLES["feature_amh_demo"].id,
    "PIDP-SERVICE/feature_pidp_demo" = var.PIDP-SERVICE.ROLES["feature_pidp_demo"].id,
    "account/view-profile"           = var.account.ROLES["view-profile"].id,
  }
}
