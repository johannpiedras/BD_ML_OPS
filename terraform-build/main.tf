

provider "aws" {
  access_key  = var.access_key
  secret_key  = var.secret_key
  region      = "us-east-1"
  
}

#source data and ingestion
#lambda function to do apipull 
/*
resource "aws_lambda_function" "test_lambda" {
  filename         = "${local.lambda_zip_location}"
  function_name    = "lambdaapipull"
  role             = aws_iam_role.lambda_role.arn
  handler          = "lambdaapipull.hello"

 #this allows to refresh the lambda fuction code
  source_code_hash = "${filebase64sha256(local.lambda_zip_location)}"
  runtime          = "python3.7"

*/

#s3 Data Lake 
resource "aws_s3_bucket" "prod_web" {
  bucket      = "2randombucketname222222"
  
#tag identifies what was made by terraform shows in aws
  tags = {
    "Terraform" : "true"
  }
}

/*
#uploading items to S3 data lake
resource "aws_s3_bucket_object" "prod_file_upload" {
  bucket = aws_s3_bucket.prod_web.id
  key    = "data.json"
  source = "./data.json"
  #etag line is for updates
  #etag = "${MD5(file(./data.json}"
}

}



#have to make sure output_path & filename match
#to maintain use locals & use same value twice
locals {
  lambda_zip_location = "outputs/lamdaapipull.zip"
}

resource "aws_glue_classifier" "import-json" {
  name = "import-json-class"

  json_classifier {
    json_path = "s3://2randombucketname22222/"
  }
}
/

#redshift cluster creation 
resource "aws_redshift_cluster" "default" {
  cluster_identifier = "tf-redshift-cluster"
  database_name      = "mydb"
  master_username    = "randomname"
  master_password    = "Mustbe8characters"
  node_type          = "dc1.large"
  cluster_type       = "single-node"
  final_snapshot_identifier = "false" 
}

#we can replicate 1 per az in our region 
resource "aws_default_subnet" "default_az1" {
  availability_zone   = "us-east-1a"

  tags = {
    "Terraform" : "true"
  }
}

*/