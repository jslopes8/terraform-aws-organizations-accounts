output "account_id" {
    value   = aws_organizations_account.main.*.id
}
output "account_arn" {
    value   = aws_organizations_account.main.*.arn
}