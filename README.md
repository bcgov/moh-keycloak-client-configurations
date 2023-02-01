# MoH Keycloak client configuration

This repository holds Keycloak client configuration files for the Ministry of Health Keycloak instance. Developers can open pull requests to change their client configuration.

## How to update a client configuration

1. Get permission from the Access Management Team to make pull requests to this repo.
2. Create a pull request with your proposed changes to a client configuration file.
3. An automatic process will compare your changes to the current state of Keycloak.
4. A bot will add a comparison report to your pull request.
5. An Access Management Team member will merge your changes into the `main` branch.
6. An automatic process will apply your changes to the Keycloak instance.

## Automation

A GitHub Actions workflow is used to apply the configurations to the Keycloak instance using Terraform.

### Overview

⚠ GitHub Actions uses a local Terraform executable, not Terraform Cloud. This diagram has not been updated.
![image](https://user-images.githubusercontent.com/1767127/169346578-be0c2c46-deb5-4ceb-879f-9710534e3eeb.png)

The workflow will:

1. check whether the configuration is formatted properly to demonstrate how you can enforce best practices
2. generate a plan for every pull request
3. apply the configuration when you update the main branch

### Detailed description

![image](https://user-images.githubusercontent.com/1767127/169342125-20158f98-8094-4430-b2b3-4f3f539bd367.png)

1. **Checkout** check outs the current configuration. Uses defines the action/Docker image to run that specific step. The checkout step "uses" GitHub's actions/checkout@v2 action.
1. **Setup Terraform** retrieves the Terraform CLI used in the GitHub action workflow.
1. **Terraform Format** checks whether the configuration has been properly formatted. If the configuration isn't properly formatted this step will produce an error. It enforces Terraform best practices by preventing your team from merging unformatted configuration to `main`.
1. **Terraform Init** initializes the configuration used in the GitHub action workflow.
1. **Terraform Validate** validates the configuration used in the GitHub action workflow.
1. **Terraform Plan** generates a Terraform plan. Notice:
    * This step only runs on pull requests. The PR generates a plan. When the PR is merged, that plan will be applied.
    * This step will continue even when it errors. This allows the next step to display the plan error message even if
      this step fails.
1. **Update Pull Request** adds a comment to the pull request with the results of the format, init and plan steps. In addition, it displays the plan output (`steps.plan.outputs.stdout`). This allows your team to review the results of the plan directly in the PR instead of viewing the GitHub Actions log. This step only runs on pull requests.
1. **Terraform Plan Status** returns whether a plan was successfully generated or not. This step highlights whenever a plan fails because the "Terraform Plan" step continues on error.
1. **Terraform Apply** applies the configuration. This step will only run when a commit is pushed to main.

### Local set-up (Access Management team only)

In some rare cases you may need to set up Terraform locally. It is easy to do so. Note that this same
configuration is used by GitHub Actions, so may refer to its commands and secrets for comparison.

1. Install Terraform (use version identified in https://github.com/bcgov/moh-keycloak-client-configurations/blob/main/.github/workflows/terraform.yml).
2. Set environment variables.
3. Checkout the project.
4. Run `terraform init -backend-config="role_arn=$AWS_S3_BACKEND_ROLE_ARN`".

Once the above steps are complete, you will be able to run all Terraform commands.

#### Environment variables

Terraform uses these secrets to access its state file stored on AWS.

* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`
* `AWS_S3_BACKEND_ROLE_ARN`
* `TF_VAR_dev_client_secret`
* `TF_VAR_test_client_secret`
* `TF_VAR_prod_client_secret`

The values for the AWS environment variables are stored in the AWS Parameter Store for
parameter `/octk/service-accounts/s3-admin`.

Example:

```json
{
  "access_key_id": "VALUE_OF_AWS_ACCESS_KEY_ID",
  "access_key_secret": "VALUE_OF_AWS_SECRET_ACCESS_KEY",
  "roles": {
    "cey5wq_sandbox_s3_admin": "VALUE_OF_AWS_S3_BACKEND_ROLE_ARN"
  }
}
```

The values for the `TF_VAR_ENV_client_secret` environment variables are Keycloak client secrets. To retrieve them, login to the development, test, and production Keycloak Admin Console and lookup their values at `moh_applications (realm) > terraform (client) > Credentials (tab)`.

## References

* [Terraform Backend Configuration](https://www.terraform.io/language/settings/backends/configuration)
* [Terraform S3 backend](https://www.terraform.io/language/settings/backends/s3)
* [Terraform Keycloak Provider](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs)

## Acknowledgements

This README uses some text verbatim and diagrams
from [Terraform's documentation](https://learn.hashicorp.com/tutorials/terraform/github-actions).
