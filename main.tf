/* Created by Jonatas Lopes (jslopes@uoldiveo.com) */

resource "aws_organizations_account" "account" {
    count   = "${var.create ? length(var.create_account) : 0}"

    name        = var.create_account[count.index]["account_name"]
    email       = var.create_account[count.index]["email"]
    role_name   = lookup(var.create_account[count.index], "iam_role_name", "null")
    
    parent_id                   = lookup(var.create_account[count.index], "parent_id", "null")
    iam_user_access_to_billing  = lookup(var.create_account[count.index], "access_billing", "null")

    #tags    = var.default_tags
    tags    = lookup(var.create_account[count.index], "default_tags", "null")
}


