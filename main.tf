################################################################################################
#
# Organizations Create Account
#

resource "aws_organizations_account" "main" {
    count   = var.create ? 1 : 0

    name        = var.account_name
    email       = var.account_email
    role_name   = var.assume_role_name
    
    parent_id                   = var.organizational_unit
    iam_user_access_to_billing  = var.enable_user_access_to_billing

    tags    = var.default_tags
}

#
# SSO Admins
#

data "aws_ssoadmin_instances" "main" {}
data "aws_ssoadmin_permission_set" "main" {
  count = var.create ? length(var.sso_permission_set_name) : 0
  
  instance_arn = tolist(data.aws_ssoadmin_instances.main.arns)[0]
  name         = element(var.sso_permission_set_name, count.index)
}

data "aws_identitystore_group" "main" {
  count = var.create ? length(var.sso_group_name) : 0

  identity_store_id = tolist(data.aws_ssoadmin_instances.main.identity_store_ids)[0]
  filter {
    attribute_path  = "DisplayName"
    attribute_value = element(var.sso_group_name, count.index)
  }
}

resource "aws_ssoadmin_account_assignment" "main" {
  count = var.create ? length(var.sso_permission_set_name) : 0

  # Set PermissionSet on Account AWS
  instance_arn       = element(data.aws_ssoadmin_permission_set.main.*.instance_arn, count.index)
  permission_set_arn = element(data.aws_ssoadmin_permission_set.main.*.arn, count.index)

  # Set Group on Account AWS
  principal_id   = element(data.aws_identitystore_group.main.*.group_id, count.index)
  principal_type = "GROUP"

  target_id   = aws_organizations_account.main.0.id
  target_type = "AWS_ACCOUNT"
}
