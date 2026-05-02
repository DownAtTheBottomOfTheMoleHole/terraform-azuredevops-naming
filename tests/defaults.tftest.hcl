# Defaults test
# Verifies that the module can be instantiated with zero arguments and produces
# the core set of outputs expected by every consumer. This is the smoke test —
# if this fails, the module is broken at its most basic contract.

run "module_loads_with_no_arguments" {
  command = apply

  assert {
    condition     = output.project.name != null
    error_message = "project.name must not be null when invoked with default inputs"
  }

  assert {
    condition     = output.project.name_unique != null
    error_message = "project.name_unique must not be null when invoked with default inputs"
  }

  assert {
    condition     = output.project.slug == "prj"
    error_message = "project.slug should default to 'prj'; got: ${output.project.slug}"
  }

  assert {
    condition     = output.project.max_length == 64
    error_message = "project.max_length should be 64 per MS naming-restrictions docs; got: ${output.project.max_length}"
  }

  assert {
    condition     = length(output.project.name_unique) <= output.project.max_length
    error_message = "project.name_unique exceeds max_length"
  }
}

run "default_environment_tags_translated" {
  command = apply

  assert {
    condition     = contains(keys(output.environment), "development")
    error_message = "Default environment_tags include 'dev' which must translate to 'development'"
  }

  assert {
    condition     = contains(keys(output.environment), "user-acceptance-testing")
    error_message = "Default environment_tags include 'uat' which must translate to 'user-acceptance-testing'"
  }

  assert {
    condition     = contains(keys(output.environment), "production")
    error_message = "Default environment_tags include 'prd' which must translate to 'production'"
  }
}

run "unique_suffix_default_length" {
  command = apply

  variables {
    prefix = ["dbmh"]
  }

  assert {
    # name_unique should be name + "-" + 4 random chars (default unique_length=4)
    condition     = length(output.project.name_unique) == length(output.project.name) + 5
    error_message = "Default unique_length=4 should add a 5-char tail (dash + 4 chars). Got name='${output.project.name}' name_unique='${output.project.name_unique}'"
  }
}
