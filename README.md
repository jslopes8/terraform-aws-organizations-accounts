# Terraform module to Create New AWS Account on AWS Organizations
Provides a resource to create a member account in the current organization.

```
WARNING: Deleting this Terraform resource will only remove an AWS account from an organization.
Terraform will not close the account. The member account must be prepared to be a standalone
account beforehand. See the AWS Organizations documentation for more information.
```

## Usange
Examplo of the use: creating an aws account as member of the a AWS Organizations

```hcl
module "create_account" {
    source = "git@github.com:jslopes8/terraform-aws-organizations-accounts.git?ref=v2.0.1"

    account_name                    = "Mobile App PoC" 
    account_email                   = "root-mobile-app-poc@example.com"
    assume_role_name                = "CrossExampleCom"
    organizational_unit_name        = "PoC"
    enable_user_access_to_billing   = "ALLOW"

    # Designate wich groups have SSO access to accounts
    sso_group_name          = [ "G_ModileAdmin" ]
    sso_permission_set_name = [ "MobileAdmin" ]
    
    # Tags
    default_tags = {
        Environment     = "PoC"
        BusinessUnit    = "MobileApp"
        CenterCost      = "1234079634"
    }
} 

```


## Requirements
| Name | Version |
| ---- | ------- |
| aws | ~> 3.* |
| terraform | ~> 0.14 |

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Variables Inputs
| Name | Description | Required | Type | Default |
| ---- | ----------- | -------- | ---- | ------- |
| account_name | The name of the new aws account that will be created. | `yes` | `string` | ` ` |
| account_email | The account email of the new aws account. | `yes` | `string` | ` ` |
| assume_role_name | The name of an IAM role that Organizations automatically preconfigures in the new member account. | `yes` | `string` | `OrganizationAccountAccessRole` |
| organizational_unit_name | The name of the specific Organizations Unit that will be assigned to the new account. | `yes` | `string` | ` ` |
| enable_user_access_to_billing | Enables IAM users to access account billing information if they have the required permissions. Value valid `ALLOW` and `DENY`. | `yes` | `string` | `DENY` |
| sso_group_name | A list of groups has SSO access to accounts. | `no` | `list` | `[ ]` |
| sso_permission_set_name | A list of permission set names has SSO access to accounts. | `no` | `list` | `[ ]` |

## Variable Outputs
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
| Name | Description |
| ---- | ----------- |
| account_id | The AWS account id |
| account_arn | The ARN for this account. |
