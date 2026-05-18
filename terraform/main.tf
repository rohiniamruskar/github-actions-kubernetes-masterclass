locals { 
    env = {
        dev = {
            instance_count = 1
            bucket_count = 1
            table_count = 1

        }

        stg = {
           instance_count = 1
           bucket_count = 1
           table_count = 1
        }

        prd = {
           instance_count = 1
           bucket_count = 1
           table_count = 1
      }
    }
    current_env = lookup(local.env, terraform.workspace, local.env["dev"])
}



module "ec2" {
  source = "./modules/ec2"      # for ec2 module
  env = terraform.workspace     # dev/stg/prd this is assigned during runtime
  ec2_instance_count = local.current_env.instance_count
}

module "s3" {
  source = "./modules/s3"       # for ec2 module
  env = terraform.workspace     # dev/stg/prd this is assigned during runtime
  s3_bucket_count = local.current_env.bucket_count
}

module "dynamodb" {
  source = "./modules/dynamodb"   # for ec2 module
  env = terraform.workspace       # dev/stg/prd this is assigned during runtime
  dynamodb_table_count = local.current_env.table_count
}
