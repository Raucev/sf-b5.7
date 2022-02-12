## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 1.1.4 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | 0.71.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.71.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_compute_image.image](https://registry.terraform.io/providers/yandex-cloud/yandex/0.71.0/docs/resources/compute_image) | resource |
| [yandex_compute_instance.default](https://registry.terraform.io/providers/yandex-cloud/yandex/0.71.0/docs/resources/compute_instance) | resource |
| [yandex_vpc_subnet.default-subnet](https://registry.terraform.io/providers/yandex-cloud/yandex/0.71.0/docs/resources/vpc_subnet) | resource |
| [yandex_compute_instance.my_instance](https://registry.terraform.io/providers/yandex-cloud/yandex/0.71.0/docs/data-sources/compute_instance) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr"></a> [cidr](#input\_cidr) | n/a | `list` | <pre>[<br>  "10.128.0.0/24"<br>]</pre> | no |
| <a name="input_image_family"></a> [image\_family](#input\_image\_family) | n/a | `string` | `"lemp"` | no |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | n/a | `string` | `"fd8vg2rh5ot45tdpgtcp"` | no |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | n/a | `string` | `"lemp"` | no |
| <a name="input_ip_address"></a> [ip\_address](#input\_ip\_address) | n/a | `string` | `"test"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"test"` | no |
| <a name="input_nat"></a> [nat](#input\_nat) | n/a | `bool` | `false` | no |
| <a name="input_nat_ip"></a> [nat\_ip](#input\_nat\_ip) | n/a | `string` | `"62.84.112.135"` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | n/a | `string` | `"default"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | n/a | `string` | `"ru-central1-a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ip_address"></a> [ip\_address](#output\_ip\_address) | n/a |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | n/a |
