variable "dynamodb_table_name" {
 description = "This variable holds dynamoDB table name"
 default = "three-tier-app-table"
 type = string
  
}

variable "env" {
 description = "This variable holds the enviroment"
 type = string
  
}

variable "dynamodb_table_count" {
 description = "This variable holds table count"
 type = number 
}