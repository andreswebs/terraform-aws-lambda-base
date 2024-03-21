output "iam_role" {
  value       = aws_iam_role.lambda_exec
  description = "The AWS Lambda IAM Role resource"
}

output "log_group" {
  value       = aws_cloudwatch_log_group.this
  description = "The AWS CloudWatch log group resource"
}
