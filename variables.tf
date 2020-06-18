variable "create" {
    type    = bool
    default = true
}
variable "create_account" {
    type    = list(map(string))
    default = []
}   
variable "default_tags" {
    type    = list(map)
    default = {}
}

