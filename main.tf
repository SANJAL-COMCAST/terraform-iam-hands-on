module "iam_role" {
 source = "./modules/iam-role"

 role_name            = "terraform-demo-role"
 assume_service       = "ec2.amazonaws.com"
 inline_policy_name   = "inline-ec2-describe"
 managed_policy_name  = "terraform-managed-policy"

 inline_policy_document = {
   Version = "2012-10-17"
   Statement = [
     {
       Effect = "Allow"
       Action = ["ec2:DescribeInstances"]
       Resource = "*"
     }
   ]
 }

 managed_policy_document = {
   Version = "2012-10-17"
   Statement = [
     {
       Effect = "Allow"
       Action = ["s3:ListBucket"]
       Resource = "*"
     }
   ]
 }
}

