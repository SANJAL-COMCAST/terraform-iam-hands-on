resource "aws_iam_role" "demo_role" {
  name = "terraform-demo-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "inline_policy" {
  name = "inline-ec2-describe"
  role = aws_iam_role.demo_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:DescribeInstances"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy" "managed_policy" {
  name = "terraform-managed-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:ListBucket"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.demo_role.name
  policy_arn = aws_iam_policy.managed_policy.arn
}

terraform {
 backend "s3" {
   bucket         = "sl-terraform-remote-state-unique123"
   key            = "iam-demo/terraform.tfstate"
   region         = "eu-north-1"
   dynamodb_table = "terraform-lock-table"
   encrypt        = true
 }
}

