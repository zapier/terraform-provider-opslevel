---
# generated by https://github.com/hashicorp/terraform-plugin-docs
page_title: "opslevel_filter Resource - terraform-provider-opslevel"
subcategory: ""
description: |-
  Manages a filter
---

# opslevel_filter (Resource)

Manages a filter

## Example Usage

```terraform
resource "opslevel_filter" "tier1" {
  name = "foo"
  predicate {
    key = "tier_index"
    type = "equals"
    value = "1"
  }
  connective = "and"
}

resource "opslevel_filter" "tier2_alpha" {
  name = "foo"
  predicate {
    key = "tier_index"
    type = "equals"
    value = "1"
  }
  predicate {
    key = "lifecycle_index"
    type = "equals"
    value = "1"
  }
  connective = "and"
}

resource "opslevel_filter" "tier3" {
  name = "foo"
  predicate {
    key      = "tags"
    type     = "does_not_exist"
    key_data = "tier3"
  }
}
```

<!-- schema generated by tfplugindocs -->
## Schema

### Required

- `name` (String) The team's display name.

### Optional

- `connective` (String) The logical operator to be used in conjunction with predicates.
- `id` (String) The ID of this resource.
- `last_updated` (String)
- `predicate` (Block List) The list of predicates used to select which services apply to the filter. (see [below for nested schema](#nestedblock--predicate))

<a id="nestedblock--predicate"></a>
### Nested Schema for `predicate`

Required:

- `key` (String) The condition key used by the predicate.
- `type` (String) The condition type used by the predicate. Valid values are `contains`, `does_not_contain`, `does_not_equal`, `does_not_exist`, `ends_with`, `equals`, `exists`, `greater_than_or_equal_to`, `less_than_or_equal_to`, `starts_with`, `satisfies_version_constraint`, `matches_regex`, `satisfies_jq_expression`

Optional:

- `key_data` (String) Additional data used by the predicate. This field is used by predicates with key = 'tags' to specify the tag key. For example, to create a predicate for services containing the tag 'db:mysql', set key_data = 'db' and value = 'mysql'.
- `value` (String) The condition value used by the predicate.

## Import

Import is supported using the following syntax:

```shell
terraform import opslevel_filter.example Z2lkOi8vb3BzbGV2ZWwvU2VydmljZS82MDI0
```