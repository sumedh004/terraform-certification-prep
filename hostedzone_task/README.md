Create a module called private hosted zone, which accepts a input domain name.

Create a first VPC. (only vpc, no need of subnets, RT, NATGW, IGW)

Create a secondary VPC (only vpc, no need of subnets, RT, NATGW, IGW)

Create Private hosted zone for VPC1. (use input hosted zone)

Associate Private hosted zone with VPC2.

Delete VPC1 after private hosted zone is connected with VPC2


## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_hostedzone"></a> [hostedzone](#module\_hostedzone) | ./modules/hostedzone | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_main_region"></a> [main\_region](#input\_main\_region) | n/a | `string` | `"us-east-1"` | no |
| <a name="input_name"></a> [name](#input\_name) | Enter name for hosted zone | `string` | n/a | yes |

## Outputs

No outputs.


## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_zone.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |
| [aws_vpc.primary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_vpc.secondary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [null_resource.delete](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Enter name for hosted zone | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-east-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc1_id"></a> [vpc1\_id](#output\_vpc1\_id) | n/a |
| <a name="output_vpc2_id"></a> [vpc2\_id](#output\_vpc2\_id) | n/a |
