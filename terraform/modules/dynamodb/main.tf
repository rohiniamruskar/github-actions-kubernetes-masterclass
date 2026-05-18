resource "aws_dynamodb_table" "my-dynamodb-table" {

  count = var.dynamodb_table_count
  name = "${var.env}-${var.dynamodb_table_name}-${count.index + 1}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"
  
  attribute {
    name = "LockID"
    type = "S"
 } 

  tags = {
   Name = "${var.env}-${var.dynamodb_table_name}-${count.index + 1}"
   Enviroment = var.env
 }
}