variable "role_name" {
 type = string
}

variable "assume_service" {
 type = string
}

variable "inline_policy_name" {
 type = string
}

variable "managed_policy_name" {
 type = string
}

variable "inline_policy_document" {
 type = any
}

variable "managed_policy_document" {
 type = any
}
