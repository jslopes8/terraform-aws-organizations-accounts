variable "create" {
    type    = bool
    default = true
}
variable "account_name" {
    description = "Nome da conta da AWS."
    type    = string
}
variable "account_email" {
    description = "Endereço de e-mail do proprietário da conta."
    type    = string
}
variable "assume_role_name" {
    description = "A conta de gerenciamento pode usar essa função do IAM para acessar recursos na conta-membro."
    type    = string
    default = "OrganizationAccountAccessRole"
}
variable "organizational_unit_name" {
    type    = string
    default = null
}
variable "enable_user_access_to_billing" {
    type    = string
    default = "DENY"
}
variable "sso_permission_set_name" {
    type    = list
    default = []
}
variable "sso_group_name" {
    type    = list
    default = []
}
variable "default_tags" {
    description = "As tags são pares de chave/valor que você pode adicionar aos recursos da AWS para ajudar a identificar, organizar e proteger seus recursos da AWS."
    type    = map
    default = {}
}