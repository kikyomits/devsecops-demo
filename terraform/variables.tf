variable "aws" {
  type = object({
    region = string
  })
  default = {
    region = "ap-southeast-2"
  }
}

variable "name" {
  type        = string
  description = "bucket name"
}

variable "acl" {
  type        = string
  default     = "private"
  description = "The canned ACL to apply. Valid values are private, public-read, public-read-write, aws-exec-read, authenticated-read, and log-delivery-write"
}

variable "tags" {
  type        = map(string)
  description = "key-value tag data to attach to resources"
  default = {
    purpose = "demo"
  }
}

variable "policy" {
  default     = null
  description = "s3 bucket policy"
  type        = string
}