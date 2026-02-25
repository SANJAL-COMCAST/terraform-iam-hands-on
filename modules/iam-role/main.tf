resource "aws_iam_role" "demo_role" {
 name = var.role_name

 assume_role_policy = jsonencode({
   Version = "2012-10-17"
   Statement = [
     {
       Effect = "Allow"
       Principal = {
         Service = var.assume_service
       }
       Action = "sts:AssumeRole"
     }
   ]
 })
}

resource "aws_iam_role_policy" "inline_policy" {
 name = var.inline_policy_name
 role = aws_iam_role.demo_role.id

 policy = jsonencode(var.inline_policy_document)
}

resource "aws_iam_policy" "managed_policy" {
 name   = var.managed_policy_name
 policy = jsonencode(var.managed_policy_document)
}

resource "aws_iam_role_policy_attachment" "attach_policy" {
 role       = aws_iam_role.demo_role.name
 policy_arn = aws_iam_policy.managed_policy.arn
}
