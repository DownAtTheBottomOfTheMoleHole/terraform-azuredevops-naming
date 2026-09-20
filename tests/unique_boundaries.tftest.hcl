# Unique suffix boundary behavior

run "suffix_is_reserved_before_the_project_boundary" {
  command = apply

  variables {
    prefix        = [join("", [for index in range(80) : "a"])]
    suffix        = []
    unique_length = 4
    unique_seed   = "u9x7"
  }

  assert {
    condition     = length(output.project.name_unique) == output.project.max_length
    error_message = "The project unique name must remain at its published maximum"
  }

  assert {
    condition     = endswith(output.project.name_unique, "-u9x7")
    error_message = "The complete unique suffix must be retained after truncation"
  }

  assert {
    condition     = output.project.name_unique != output.project.name
    error_message = "A non-empty unique suffix must always produce a distinct name"
  }
}

run "collision_with_the_displaced_tail_is_avoided" {
  command = apply

  variables {
    prefix        = ["${join("", [for index in range(59) : "a"])}-u9x7"]
    suffix        = []
    unique_length = 4
    unique_seed   = "u9x7"
  }

  assert {
    condition     = output.project.name_unique != output.project.name
    error_message = "Suffix reservation must handle a base already ending in the deterministic suffix"
  }

  assert {
    condition     = endswith(output.project.name_unique, "-u9x7")
    error_message = "The collision fallback must still retain the complete suffix"
  }
}

run "maximum_supported_unique_length_fits_the_shortest_contract" {
  command = apply

  variables {
    prefix        = [join("", [for index in range(80) : "a"])]
    suffix        = []
    unique_length = 47
    unique_seed   = join("", [for index in range(47) : index == 0 ? "u" : "9"])
  }

  assert {
    condition     = length(output.organization.name_unique) <= output.organization.max_length
    error_message = "The maximum supported unique token must fit the 49-character organization limit"
  }

  assert {
    condition     = endswith(output.organization.name_unique, var.unique_seed)
    error_message = "The shortest naming contract must retain all 47 unique characters"
  }
}

run "zero_unique_length_adds_no_random_separator" {
  command = apply

  variables {
    environment_tags = ["dev"]
    prefix           = ["dbmh"]
    suffix           = ["shared"]
    unique_length    = 0
    unique_seed      = "ignored"
    work_items       = ["1234"]
  }

  assert {
    condition     = output.project.name_unique == output.project.name
    error_message = "Zero unique length must not append an empty random separator"
  }

  assert {
    condition     = output.environment_basic["development"].name_unique == "development-shared"
    error_message = "Basic environment outputs must preserve their existing configured-suffix behavior"
  }

  assert {
    condition     = output.environment_work_item_basic["development"]["1234"].name_unique == "development-1234-shared"
    error_message = "Basic environment work-item outputs must preserve their configured suffix"
  }
}
