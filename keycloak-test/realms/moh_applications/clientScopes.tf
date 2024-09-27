resource "keycloak_openid_client_scope" "idir_openid_client_scope" {
  realm_id    = "moh_applications"
  name        = "idir"
  description = "Assign this scope to an OIDC client using IDP restriction module to allow logging in with IDIR."
}

resource "keycloak_openid_client_scope" "idir_aad_openid_client_scope" {
  realm_id    = "moh_applications"
  name        = "idir_aad"
  description = "Assign this scope to an OIDC client using IDP restriction module to allow logging in with IDIR MFA."
}

resource "keycloak_openid_client_scope" "phsa_openid_client_scope" {
  realm_id    = "moh_applications"
  name        = "phsa"
  description = "Assign this scope to an OIDC client using IDP restriction module to allow logging in with Health Authority."
}

resource "keycloak_openid_client_scope" "phsa_aad_openid_client_scope" {
  realm_id    = "moh_applications"
  name        = "phsa_aad"
  description = "Assign this scope to an OIDC client using IDP restriction module to allow logging in with Health Authority MFA."
}

resource "keycloak_openid_client_scope" "fnha_aad_openid_client_scope" {
  realm_id    = "moh_applications"
  name        = "fnha_aad"
  description = "Assign this scope to an OIDC client using IDP restriction module to allow logging in with FNHA MFA."
}

resource "keycloak_openid_client_scope" "bceid_business_openid_client_scope" {
  realm_id    = "moh_applications"
  name        = "bceid_business"
  description = "Assign this scope to an OIDC client using IDP restriction module to allow logging in with BceID Business."
}

resource "keycloak_openid_client_scope" "bcprovider_aad_openid_client_scope" {
  realm_id    = "moh_applications"
  name        = "bcprovider_aad"
  description = "Assign this scope to an OIDC client using IDP restriction module to allow logging in with BC Provider."
}

resource "keycloak_openid_client_scope" "bcsc_openid_client_scope" {
  realm_id    = "moh_applications"
  name        = "bcsc"
  description = "Assign this scope to an OIDC client using IDP restriction module to allow logging in with BC Services Card for PIdP."
}

resource "keycloak_openid_client_scope" "bcsc_mspdirect_openid_client_scope" {
  realm_id    = "moh_applications"
  name        = "bcsc_mspdirect"
  description = "Assign this scope to an OIDC client using IDP restriction module to allow logging in with BC Services Card for MSPDirect."
}

resource "keycloak_openid_client_scope" "bcsc_hcap_openid_client_scope" {
  realm_id    = "moh_applications"
  name        = "bcsc_hcap"
  description = "Assign this scope to an OIDC client using IDP restriction module to allow logging in with BC Services Card for HCAP."
}

resource "keycloak_openid_client_scope" "bcsc_prime_openid_client_scope" {
  realm_id    = "moh_applications"
  name        = "bcsc_prime"
  description = "Assign this scope to an OIDC client using IDP restriction module to allow logging in with BC Services Card for PRIME."
}


resource "keycloak_openid_client_scope" "moh_idp_openid_client_scope" {
  realm_id    = "moh_applications"
  name        = "moh_idp"
  description = "Assign this scope to an OIDC client using IDP restriction module to allow logging in with Keycloak."
}

resource "keycloak_saml_client_scope" "idir_saml_client_scope" {
  realm_id    = "moh_applications"
  name        = "idir-saml"
  description = "Assign this scope to a SAML client using IDP restriction module to allow logging in with IDIR."
}

resource "keycloak_saml_client_scope" "idir_aad_saml_client_scope" {
  realm_id    = "moh_applications"
  name        = "idir_aad-saml"
  description = "Assign this scope to a SAML client using IDP restriction module to allow logging in with IDIR MFA."
}

resource "keycloak_saml_client_scope" "phsa_saml_client_scope" {
  realm_id    = "moh_applications"
  name        = "phsa-saml"
  description = "Assign this scope to a SAML client using IDP restriction module to allow logging in with Health Authority."
}

resource "keycloak_saml_client_scope" "phsa_aad_saml_client_scope" {
  realm_id    = "moh_applications"
  name        = "phsa_aad-saml"
  description = "Assign this scope to a SAML client using IDP restriction module to allow logging in with Health Authority MFA."
}

resource "keycloak_saml_client_scope" "fnha_aad_saml_client_scope" {
  realm_id    = "moh_applications"
  name        = "fnha_aad-saml"
  description = "Assign this scope to a SAML client using IDP restriction module to allow logging in with FNHA MFA."
}

resource "keycloak_saml_client_scope" "bceid_business_saml_client_scope" {
  realm_id    = "moh_applications"
  name        = "bceid_business-saml"
  description = "Assign this scope to a SAML client using IDP restriction module to allow logging in with BceID Business."
}

resource "keycloak_saml_client_scope" "bcprovider_aad_saml_client_scope" {
  realm_id    = "moh_applications"
  name        = "bcprovider_aad-saml"
  description = "Assign this scope to a SAML client using IDP restriction module to allow logging in with BC Provider."
}

resource "keycloak_saml_client_scope" "bcsc_saml_client_scope" {
  realm_id    = "moh_applications"
  name        = "bcsc-saml"
  description = "Assign this scope to a SAML client using IDP restriction module to allow logging in with BC Services Card for PIdP."
}

resource "keycloak_saml_client_scope" "bcsc_mspdirect_saml_client_scope" {
  realm_id    = "moh_applications"
  name        = "bcsc_mspdirect-saml"
  description = "Assign this scope to a SAML client using IDP restriction module to allow logging in with BC Services Card for MSPDirect."
}

resource "keycloak_saml_client_scope" "bcsc_hcap_saml_client_scope" {
  realm_id    = "moh_applications"
  name        = "bcsc_hcap-saml"
  description = "Assign this scope to a SAML client using IDP restriction module to allow logging in with BC Services Card for HCAP."
}

resource "keycloak_saml_client_scope" "bcsc_prime_saml_client_scope" {
  realm_id    = "moh_applications"
  name        = "bcsc_prime-saml"
  description = "Assign this scope to a SAML client using IDP restriction module to allow logging in with BC Services Card for PRIME."
}

resource "keycloak_saml_client_scope" "moh_idp_openid_client_scope" {
  realm_id    = "moh_applications"
  name        = "moh_idp-saml"
  description = "Assign this scope to a SAML client using IDP restriction module to allow logging in with Keycloak."
}