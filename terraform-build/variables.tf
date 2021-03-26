#defining our variables and compile data  

#creating a zip file/Archive a single file 

/*
data "archive_file" "lambdaapipull" {
  type        = "zip"
  source_file = "lambdaapipull.py"
  output_path = local.lambda_zip_location
}
*/

variable "whitelist" {
  type = list(string)
}                 
variable "prod_image_id" {
  type = string
}                
variable "prod_instance_type" {
  type = string
}      
variable "prod_desired_capacity" {
  type = number
}   
variable "prod_max_size" {
  type = number
}            
variable "prod_min_size" {
  type = number
} 
variable "access_key" {
  type = string
  default = "none"
} 
variable "secret_key" {
  type = string
  default = "none"
} 