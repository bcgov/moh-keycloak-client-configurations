#module "newclient" {
#  source = "./modules/payara-client"
#
#  client_id   = "NEWCLIENT"
#  claim_name  = "newclient_role"
#  base_url    = "https://cgi.com"
#  description = "New client description"
#  valid_redirect_uris = [
#    "http://localhost:8080/*",
#    "https://cgi.com/*",
#    "https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
#  ]
#  roles = {
#    "ROLE1" = {
#      "name"        = "ROLE1"
#      "description" = "A description for role 1"
#    },
#    "ROLE1" = {
#      "name"        = "ROLE2"
#      "description" = "A description for role 2"
#    }
#  }
#}