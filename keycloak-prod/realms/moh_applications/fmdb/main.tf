module "payara-client" {
    source                             = "../../../../modules/payara-client"
    base_url                           = "https://fmdb.hlth.gov.bc.ca/FMDB"
    claim_name                         = "fmdb_role"
    client_id                          = "FMDB"
    client_name                        = "FMDB"
    client_role_mapper_add_to_id_token = false
    client_role_mapper_add_to_userinfo = false
    description                        = "The Formulary Management Database application is a database of drugs which have been reviewed for inclusion as benefits under the PharmaCare program."
    mapper_name                        = "FMDB Role"
    roles                              = {
        "MOHUSER" = {
            "name" = "MOHUSER"
            "description" = "The base user permission for FMDB"
        },
        "PSDADMIN" = {
            "name" = "PSDADMIN"
            "description" = "Admin role for FMDB provides access to code table management"
        },
    }
    service_accounts_enabled           = false
    use_refresh_tokens                 = false
    valid_redirect_uris                = [
        "https://fmdb.hlth.gov.bc.ca/*",
        "https://logon7.gov.bc.ca/clp-cgi/logoff.cgi*",
    ]
}
