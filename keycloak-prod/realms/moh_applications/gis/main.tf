module "payara-client" {
    source                             = "../../../../modules/payara-client"
    base_url                           = "https://gis.hlth.gov.bc.ca/gis"
    claim_name                         = "gis_role"
    client_id                          = "GIS"
    client_name                        = "GIS"
    client_role_mapper_add_to_id_token = false
    client_role_mapper_add_to_userinfo = false
    description                        = "The Guaranteed Income Supplement is used by Health Authorities to determine the rate of service fees to be charged to the client for certain Home Care services (Home Support or Residential Care)."
    mapper_name                        = "GIS Role"
    roles                              = {
        "GISUSER" = {
            "name" = "GISUSER"
            "description" = ""
        },
    }
    service_accounts_enabled           = false
    use_refresh_tokens                 = false
    valid_redirect_uris = [
        "https://gis.hlth.gov.bc.ca/*",
        "https://logon7.gov.bc.ca/clp-cgi/logoff.cgi*",
        "https://sts.healthbc.org/adfs/ls/*",
    ]
}
