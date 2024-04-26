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
    "https://pr-316.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-317.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-318.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-319.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-320.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-321.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-322.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-323.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-324.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-325.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-326.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-327.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-328.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-329.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-330.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-331.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-332.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-333.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-334.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-335.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-336.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-337.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-338.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-339.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-340.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-341.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-342.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-343.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-344.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-345.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-346.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-347.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-348.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-349.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-350.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-351.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-352.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-353.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-354.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-355.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-356.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-357.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-358.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-359.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-360.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-361.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-362.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-363.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-364.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-365.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-366.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-367.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-368.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-369.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-370.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-371.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-372.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-373.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-374.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-375.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-376.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-377.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-378.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-379.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-380.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-381.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-382.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-383.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-384.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-385.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-386.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-387.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-388.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-389.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-390.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-391.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-392.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-393.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-394.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-395.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-396.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-397.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-398.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-399.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-400.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-401.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-402.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-403.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-404.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-405.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-406.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-407.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-408.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-409.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-410.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-411.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-412.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-413.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-414.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-415.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-416.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-417.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-418.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-419.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-420.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-421.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-422.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-423.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-424.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-425.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-426.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-427.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-428.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-429.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-430.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-431.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-432.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-433.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-434.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-435.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-436.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-437.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-438.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-439.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-440.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-441.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-442.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-443.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-444.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-445.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-446.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-447.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-448.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-449.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-450.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-451.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-452.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-453.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-454.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-455.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-456.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-457.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-458.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-459.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-460.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-461.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-462.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-463.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-464.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-465.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-466.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-467.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-468.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-469.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-470.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-471.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-472.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-473.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-474.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-475.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-476.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-477.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-478.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-479.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-480.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-481.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-482.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-483.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-484.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-485.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-486.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-487.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-488.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-489.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-490.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-491.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-492.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-493.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-494.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-495.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-496.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-497.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-498.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-499.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-500.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-501.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-502.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-503.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-504.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-505.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-506.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-507.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-508.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-509.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-510.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-511.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-512.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-513.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-514.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-515.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-516.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-517.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-518.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-519.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-520.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-521.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-522.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-523.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-524.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-525.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-526.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-527.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-528.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-529.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-530.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-531.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-532.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-533.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-534.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-535.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-536.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-537.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-538.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-539.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-540.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-541.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-542.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-543.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-544.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-545.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-546.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-547.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-548.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-549.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-550.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-551.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-552.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-553.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-554.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-555.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-556.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-557.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-558.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-559.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-560.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-561.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-562.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-563.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-564.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-565.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-566.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-567.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-568.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-569.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-570.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-571.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-572.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-573.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-574.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-575.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-576.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-577.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-578.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-579.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-580.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-581.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-582.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-583.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-584.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-585.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-586.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-587.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-588.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-589.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-590.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-591.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-592.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-593.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-594.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-595.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-596.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-597.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-598.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-599.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-600.healthprovideridentityportal.gov.bc.ca/*",
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
resource "keycloak_openid_user_attribute_protocol_mapper" "birthdate" {
  claim_name     = "birthdate"
  client_id      = keycloak_openid_client.CLIENT.id
  name           = "birthdate"
  user_attribute = "birthdate"
  realm_id       = keycloak_openid_client.CLIENT.realm_id
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
  source    = "../../../../../modules/scope-mappings"
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  roles = {
    "PIDP-SERVICE/ADMIN"             = var.PIDP-SERVICE.ROLES["ADMIN"].id,
    "PIDP-SERVICE/USER"              = var.PIDP-SERVICE.ROLES["USER"].id,
    "PIDP-SERVICE/feature_pidp_demo" = var.PIDP-SERVICE.ROLES["feature_pidp_demo"].id,
    "account/view-profile"           = var.account.ROLES["view-profile"].id,
  }
}
resource "keycloak_openid_user_attribute_protocol_mapper" "phsa_windowsaccoutname" {
  add_to_id_token = true
  add_to_userinfo = true
  claim_name      = "preferred_username"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "phsa_windowsaccoutname"
  user_attribute  = "phsa_windowsaccoutname"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}
