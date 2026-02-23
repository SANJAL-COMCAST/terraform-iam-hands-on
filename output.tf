output "role_name" {
  value = aws_iam_role.demo_role.name
}

output "managed_policy_arn" {
  value = aws_iam_policy.managed_policy.arn
}
