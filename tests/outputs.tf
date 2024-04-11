output "iam_role_arn" {
  value = module.lambda_base_demo.iam_role.arn
}

output "log_group_name" {
  value = module.lambda_base_demo.log_group.name
}
