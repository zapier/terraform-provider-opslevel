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

resource "opslevel_check_repository_search" "example" {
  name = "foo"
  enabled = true
  category = data.opslevel_rubric_category.security.id
  level = data.opslevel_rubric_level.bronze.id
  owner = data.opslevel_team.devs.id
  filter = data.opslevel_filter.tier1.id
  file_extensions = ["sbt", "py"]
  file_contents_predicate {
      type = "equals"
      value = "postgres"
  }
  notes = "Optional additional info on why this check is run or how to fix it"
}