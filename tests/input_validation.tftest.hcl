# Input validation
# Verifies that invalid numeric values fail early and explicit nulls use the
# documented defaults instead of reaching join, distinct, or substr.

run "fractional_unique_length_is_rejected" {
  command = plan

  variables {
    unique_length = 1.5
  }

  expect_failures = [var.unique_length]
}

run "unique_length_above_the_supported_boundary_is_rejected" {
  command = plan

  variables {
    unique_length = 48
  }

  expect_failures = [var.unique_length]
}

run "explicit_nulls_use_defaults" {
  command = apply

  variables {
    environment_tags       = null
    prefix                 = null
    suffix                 = null
    unique_include_numbers = null
    unique_length          = null
    unique_seed            = null
    work_items             = null
  }

  assert {
    condition     = length(output.environment) == 3
    error_message = "A null environment_tags input must use the three default environments"
  }

  assert {
    condition     = length(output.unique_seed) == 61
    error_message = "A null unique_seed input must use the generated 61-character default"
  }
}
