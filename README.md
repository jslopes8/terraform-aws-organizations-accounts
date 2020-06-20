# Terraform module to AWS IAM Role
Criando uma role, com relação de confiaça para uma conta externa. Por exemplo, CloudHealth.

## Usange
```hcl
module "create_account" {
    source = ""

    create_account  = [
        {
            account_name    = "aws-test"
            email           = "test@exemple.com"
            role_name       = "CrossAccountAdmin"
            default_tags    = {
                Enviroment  = "Homolog"
                Customer    = "Test"
            }
        }
    ]  
} 

```