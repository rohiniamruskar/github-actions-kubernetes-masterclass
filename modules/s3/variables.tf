variable "s3_bucket_name" {
 description = "This variable holds s3 bucket name"
 default = "three-tier-app-2026"
 type = string
  
}

variable "env" {
 description = "This variable holds the enviroment"
 type = string
  
}

variable "s3_bucket_count" {
 description = "This variable holds S3 bucket count"
 type = number 
}