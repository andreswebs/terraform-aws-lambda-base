# terraform-aws-lambda-base

Create environment dependencies for Lambda functions:

- IAM role
- Permissions
- CloudWatch Log Group

[//]: # "BEGIN_TF_DOCS"

## Usage

Example:

```hcl
module "lambda_base" {
  source = "github.com/andreswebs/terraform-aws-lambda-base"
  name   = "demo"
}
```

## Inputs

| Name                                                                                                   | Description                                                         | Type     | Default         | Required |
| ------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------- | -------- | --------------- | :------: |
| <a name="input_log_group_prefix"></a> [log_group_prefix](#input_log_group_prefix)                      | The log group prefix                                                | `string` | `"/aws/lambda"` |    no    |
| <a name="input_log_retention_in_days"></a> [log_retention_in_days](#input_log_retention_in_days)       | The number of days to retain the log events in the log group        | `number` | `30`            |    no    |
| <a name="input_name"></a> [name](#input_name)                                                          | Generic service name, used to name module resources                 | `string` | n/a             |   yes    |
| <a name="input_service"></a> [service](#input_service)                                                 | The service principal for the role. Can be 'lambda' or 'states'     | `string` | `"lambda"`      |    no    |
| <a name="input_vpc_permissions_enabled"></a> [vpc_permissions_enabled](#input_vpc_permissions_enabled) | (Optional) Whether to enable VPC permissions for the execution role | `bool`   | `false`         |    no    |

## Modules

No modules.

## Outputs

| Name                                                           | Description                             |
| -------------------------------------------------------------- | --------------------------------------- |
| <a name="output_iam_role"></a> [iam_role](#output_iam_role)    | The `aws_iam_role` resource             |
| <a name="output_log_group"></a> [log_group](#output_log_group) | The `aws_cloudwatch_log_group` resource |

## Providers

| Name                                             | Version |
| ------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | ~> 5.0  |

## Requirements

| Name                                                                     | Version |
| ------------------------------------------------------------------------ | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | ~> 1.5  |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | ~> 5.0  |

## Resources

| Name                                                                                                                                                                | Type        |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group)                                   | resource    |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role)                                                           | resource    |
| [aws_iam_role_policy.service_permissions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy)                              | resource    |
| [aws_iam_role_policy_attachment.cloudwatch_lambda_insights](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource    |
| [aws_iam_role_policy_attachment.xray](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment)                       | resource    |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity)                                       | data source |
| [aws_iam_policy_document.log_permissions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)                       | data source |
| [aws_iam_policy_document.service_permissions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)                   | data source |
| [aws_iam_policy_document.service_trust](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)                         | data source |
| [aws_iam_policy_document.vpc_permissions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)                       | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition)                                                   | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region)                                                         | data source |

[//]: # "END_TF_DOCS"

## Authors

**Andre Silva** [@andreswebs](https://github.com/andreswebs)

## License

This project is licensed under the [Unlicense](UNLICENSE.md).

[//]: # (BEGIN_TF_DOCS)


## Usage

Example:

```hcl
module "lambda_base" {
  source = "github.com/andreswebs/terraform-aws-lambda-base"
  name   = "demo"
}
```



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_log_group_prefix"></a> [log\_group\_prefix](#input\_log\_group\_prefix) | The log group prefix | `string` | `"/aws/lambda"` | no |
| <a name="input_log_retention_in_days"></a> [log\_retention\_in\_days](#input\_log\_retention\_in\_days) | The number of days to retain the log events in the log group | `number` | `90` | no |
| <a name="input_name"></a> [name](#input\_name) | Generic service name, used to name module resources | `string` | n/a | yes |
| <a name="input_service"></a> [service](#input\_service) | The service principal for the role. Can be 'lambda' or 'states' | `string` | `"lambda"` | no |
| <a name="input_vpc_permissions_enabled"></a> [vpc\_permissions\_enabled](#input\_vpc\_permissions\_enabled) | (Optional) Whether to enable VPC permissions for the execution role | `bool` | `false` | no |

## Modules

No modules.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_role"></a> [iam\_role](#output\_iam\_role) | The `aws_iam_role` resource |
| <a name="output_log_group"></a> [log\_group](#output\_log\_group) | The `aws_cloudwatch_log_group` resource |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.10 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.service_permissions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.log_permissions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.service_permissions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.service_trust](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.vpc_permissions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

[//]: # (END_TF_DOCS)