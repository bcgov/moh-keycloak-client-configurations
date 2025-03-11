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
    "https://dev.healthprovideridentityportal.gov.bc.ca/*",
    "https://dev.healthprovideridentityportal.gov.bc.ca",
    "https://pr-585.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-600.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-601.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-602.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-603.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-604.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-605.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-606.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-607.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-608.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-609.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-610.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-611.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-612.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-613.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-614.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-615.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-616.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-617.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-618.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-619.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-620.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-621.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-622.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-623.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-624.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-625.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-626.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-627.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-628.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-629.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-630.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-631.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-632.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-633.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-634.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-635.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-636.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-637.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-638.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-639.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-640.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-641.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-642.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-643.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-644.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-645.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-646.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-647.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-648.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-649.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-650.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-651.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-652.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-653.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-654.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-655.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-656.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-657.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-658.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-659.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-660.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-661.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-662.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-663.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-664.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-665.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-666.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-667.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-668.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-669.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-670.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-671.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-672.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-673.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-674.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-675.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-676.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-677.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-678.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-679.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-680.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-681.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-682.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-683.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-684.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-685.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-686.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-687.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-688.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-689.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-690.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-691.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-692.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-693.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-694.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-695.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-696.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-697.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-698.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-699.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-700.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-701.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-702.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-703.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-704.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-705.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-706.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-707.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-708.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-709.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-710.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-711.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-712.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-713.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-714.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-715.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-716.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-717.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-718.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-719.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-720.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-721.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-722.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-723.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-724.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-725.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-726.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-727.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-728.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-729.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-730.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-731.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-732.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-733.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-734.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-735.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-736.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-737.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-738.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-739.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-740.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-741.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-742.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-743.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-744.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-745.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-746.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-747.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-748.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-749.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-750.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-751.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-752.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-753.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-754.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-755.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-756.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-757.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-758.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-759.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-760.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-761.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-762.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-763.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-764.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-765.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-766.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-767.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-768.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-769.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-770.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-771.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-772.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-773.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-774.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-775.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-776.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-777.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-778.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-779.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-780.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-781.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-782.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-783.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-784.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-785.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-786.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-787.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-788.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-789.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-790.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-791.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-792.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-793.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-794.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-795.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-796.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-797.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-798.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-799.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-800.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-801.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-802.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-803.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-804.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-805.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-806.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-807.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-808.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-809.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-810.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-811.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-812.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-813.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-814.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-815.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-816.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-817.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-818.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-819.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-820.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-821.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-822.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-823.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-824.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-825.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-826.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-827.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-828.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-829.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-830.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-831.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-832.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-833.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-834.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-835.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-836.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-837.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-838.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-839.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-840.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-841.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-842.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-843.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-844.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-845.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-846.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-847.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-848.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-849.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-850.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-851.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-852.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-853.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-854.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-855.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-856.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-857.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-858.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-859.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-860.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-861.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-862.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-863.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-864.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-865.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-866.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-867.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-868.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-869.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-870.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-871.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-872.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-873.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-874.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-875.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-876.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-877.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-878.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-879.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-880.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-881.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-882.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-883.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-884.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-885.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-886.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-887.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-888.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-889.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-890.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-891.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-892.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-893.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-894.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-895.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-896.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-897.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-898.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-899.healthprovideridentityportal.gov.bc.ca/*",
    "https://pr-900.healthprovideridentityportal.gov.bc.ca/*",
  ]
  web_origins = [
    "*",
  ]
  authentication_flow_binding_overrides {
    browser_id = var.browser_idp_restriction_flow
  }
  login_theme = "moh-app-realm-idp-restriction"
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
resource "keycloak_generic_client_protocol_mapper" "phsa_windowsaccountname" {
  realm_id        = keycloak_openid_client.CLIENT.realm_id
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "preferred_username"
  protocol        = "openid-connect"
  protocol_mapper = "oidc-override-usermodel-attribute-mapper"
  config = {
    "userinfo.token.claim" : "true",
    "user.attribute" : "phsa_windowsaccountname",
    "id.token.claim" : "true",
    "access.token.claim" : "true",
    "claim.name" : "preferred_username",
    "jsonType.label" : "String",
    "introspection.token.claim" = "false"
  }
}

resource "keycloak_openid_client_default_scopes" "client_default_scopes" {
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  default_scopes = [
    "bcprovider_aad",
    "bcsc",
    "idir_aad",
    "phsa",
    "email",
    "profile",
    "roles",
    "web-origins",
    "basic"
  ]
}