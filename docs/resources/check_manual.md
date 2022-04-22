---
# generated by https://github.com/hashicorp/terraform-plugin-docs
page_title: "opslevel_check_manual Resource - terraform-provider-opslevel"
subcategory: ""
description: |-
  Manages a manual check.
---

# opslevel_check_manual (Resource)

Manages a manual check.

## Example Usage

```terraform
data "opslevel_rubric_category" "security" {
  filter {
    field = "name"
    value = "Security"
  }
}

data "opslevel_rubric_level" "bronze" {
  filter {
    field = "name"
    value = "Bronze"
  }
}

data "opslevel_team" "devs" {
  alias = "developers"
}

data "opslevel_filter" "tier1" {
  filter {
    field = "name"
    value = "Tier 1"
  }
}

resource "time_static" "initial" {}

resource "opslevel_check_manual" "example" {
  name = "foo"
  enabled = true
  category = data.opslevel_rubric_category.security.id
  level = data.opslevel_rubric_level.bronze.id
  owner = data.opslevel_team.devs.id
  filter = data.opslevel_filter.tier1.id
  update_frequency {
    starting_data = time_static.initial.id
    time_scale = "week"
    value = 1
  }
  update_requires_comment = false
  notes = "Optional additional info on why this check is run or how to fix it"
}
```

<!-- schema generated by tfplugindocs -->
## Schema

### Required

- `category` (String) The id of the category the check belongs to.
- `level` (String) The id of the level the check belongs to.
- `name` (String) The display name of the check.
- `update_requires_comment` (Boolean) Whether the check requires a comment or not.

### Optional

- `enabled` (Boolean) Whether the check is enabled or not.
- `filter` (String) The id of the filter of the check.
- `id` (String) The ID of this resource.
- `last_updated` (String)
- `notes` (String) Additional information about the check.
- `owner` (String) The id of the team that owns the check.
- `update_frequency` (Block List, Max: 1) Defines the minimum frequency of the updates. (see [below for nested schema](#nestedblock--update_frequency))

<a id="nestedblock--update_frequency"></a>
### Nested Schema for `update_frequency`

Required:

- `starting_data` (String) The date that the check will start to evaluate.
- `time_scale` (String) The time scale type for the frequency.
- `value` (Number) The value to be used together with the frequency scale.

## Import

Import is supported using the following syntax:

```shell
terraform import opslevel_check_manual.example Z2lkOi8vb3BzbGV2ZWwvU2VydmljZS82MDI0
```