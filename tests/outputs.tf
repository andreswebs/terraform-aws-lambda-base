output "iam_role_arn" {
  value = module.lambda_base.iam_role.arn
}

output "log_group_name" {
  value = module.lambda_base.log_group.name
}
