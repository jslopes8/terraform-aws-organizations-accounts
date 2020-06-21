# Terraform module to Create New AWS Account on AWS Organizations
Provides a resource to create a member account in the current organization.

```
WARNING: Deleting this Terraform resource will only remove an AWS account from an organization.
Terraform will not close the account. The member account must be prepared to be a standalone
account beforehand. See the AWS Organizations documentation for more information.
```

The `create_account` block has the following attributes as required:

- `account_name`: the name of the new aws account that will be created.
- `email`: the account email of the new aws account.
- `iam_role_name`: the name of an IAM role that Organizations automatically preconfigures in the new member account.
- `organizational_unit`: parent Organizational Unit ID or Root ID for the account. Defaults to the Organization default Root ID.
- `iam_user_access_to_billing`: enables IAM users to access account billing information if they have the required permissions.
- `default_tags`: Key-value map of resource tags.


## Usange
Examplo of the use: creating an aws account as member of the a AWS Organizations

```hcl
module "create_account" {
    source = "git@github.com:jslopes8/terraform-aws-organizations-accounts.git?ref=v1.1.1"

    create_account  = [
        {
            account_name    = "aws-test"
            email           = "test@exemple.com"

            iam_role_name   = "CrossAccountAdmin"

            default_tags    = {
                Enviroment  = "Homolog"
                Customer    = "Test"
            }
        }
    ]  
} 

```

Examplo of the use: creating Multipe New AWS Account as member of the a AWS Organizations
```hcl
module "create_account" {
    source = "git@github.com:jslopes8/terraform-aws-organizations-accounts.git?ref=v1.1.1"

    create_account  = [
        {
            account_name    = "aws-test"
            email           = "test@exemple.com"

            iam_role_name   = "CrossAccountAdmin"

            default_tags    = {
                Enviroment  = "Homolog"
                Customer    = "Test"
            }
        },
       {
            account_name    = "aws-test-02"
            email           = "test-2@exemple.com"

            iam_role_name   = "CrossAccountAdmin"

            default_tags    = {
                Enviroment  = "Development"
                Customer    = "Test-02"
            }
        }
    ]  
} 

```

## Requirements
| Name | Version |
| ---- | ------- |
| aws | ~> 2.35 |
| terraform | ~> 0.12 |

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Variables Inputs
| Name | Description | Required | Type | Default |
| ---- | ----------- | -------- | ---- | ------- |
| create_account | Key-value map of attributes for create new account. | `yes` | `map` | `[ ]` |


## Variable Outputs
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
| Name | Description |
| ---- | ----------- |
| account_id | The AWS account id |
| account_arn | The ARN for this account. |