### Changes being made

Please include a short summary of the change.

### Context

What is the context for those changes? For example: particular role needs to be shown in token. Reference Azure Board task, if applicable.

### Quality Check

- [ ] Client has name and description.
- [ ] Full Scope is not allowed.
- [ ] Direct Access Grant is disabled.
- [ ] Redirect URIs are properly defined, explenation for `*` (allow all) is provided. 
- [ ] Web origins are set to `+` instead of `*` to restrict the CORS origins.
- [ ] Client module and all it's references are defined in main.tf in realm root folder.
- [ ] [CMDB](https://cmdb.hlth.gov.bc.ca/cmdbuildProd/ui/#classes/Application/cards) is updated.
- [ ] Terraform plan contains only my changes, or other developers are aware that their manual changes can be overridden. 