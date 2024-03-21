data "aws_partition" "current" {}
data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

locals {
  partition  = data.aws_partition.current.partition
  region     = data.aws_region.current.name
  account_id = data.aws_caller_identity.current.account_id
}

locals {
  log_group_name = "${var.log_group_prefix}/${var.lambda_name}"
  log_group_arn  = "arn:${local.partition}:logs:${local.region}:${local.account_id}:log-group:${local.log_group_name}:*"
}

data "aws_iam_policy_document" "lambda_service_trust" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "lambda_exec" {
  name                  = var.lambda_name
  assume_role_policy    = data.aws_iam_policy_document.lambda_service_trust.json
  force_detach_policies = true
}

data "aws_iam_policy_document" "lambda_log_permissions" {

  statement {
    sid = "logs"
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = [
      "${local.log_group_arn}",
      "${local.log_group_arn}:*",
      "${local.log_group_arn}:*:*"
    ]
  }

}

data "aws_iam_policy_document" "lambda_vpc_permissions" {
  statement {
    sid = "vpc"
    actions = [
      "ec2:CreateNetworkInterface",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DescribeSubnets",
      "ec2:DeleteNetworkInterface",
      "ec2:AssignPrivateIpAddresses",
      "ec2:UnassignPrivateIpAddresses"
    ]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "lambda_permissions" {
  source_policy_documents = [
    data.aws_iam_policy_document.lambda_log_permissions.json,
    data.aws_iam_policy_document.lambda_vpc_permissions.json,
  ]
}

resource "aws_iam_role_policy" "lambda_permissions" {
  name   = "lambda-permissions"
  role   = aws_iam_role.lambda_exec.id
  policy = data.aws_iam_policy_document.lambda_permissions.json
}

resource "aws_cloudwatch_log_group" "this" {
  name              = local.log_group_name
  retention_in_days = var.log_retention_in_days
}

resource "aws_iam_role_policy_attachment" "xray" {
  role       = aws_iam_role.lambda_exec.id
  policy_arn = "arn:${local.partition}:iam::aws:policy/AWSXrayWriteOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "cloudwatch_lambda_insights" {
  role       = aws_iam_role.lambda_exec.id
  policy_arn = "arn:${local.partition}:iam::aws:policy/CloudWatchLambdaInsightsExecutionRolePolicy"
}
