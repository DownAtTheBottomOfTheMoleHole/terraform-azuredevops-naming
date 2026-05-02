# Environment tag translation
# Verifies the local.environment_mapping translation table behaves as documented.
# Adding/removing tags here must be reflected in variables.tf validation.

run "all_short_tags_translate_to_full_names" {
  command = apply

  variables {
    environment_tags = ["acc", "aud", "com", "dev", "eph", "fet", "hot", "int", "pen", "per", "prd", "prod", "reg", "stg", "sys", "tst", "uat"]
  }

  assert {
    condition     = contains(keys(output.environment), "accessibility-testing")
    error_message = "'acc' must translate to 'accessibility-testing'"
  }
  assert {
    condition     = contains(keys(output.environment), "audit-testing")
    error_message = "'aud' must translate to 'audit-testing'"
  }
  assert {
    condition     = contains(keys(output.environment), "compliance-testing")
    error_message = "'com' must translate to 'compliance-testing'"
  }
  assert {
    condition     = contains(keys(output.environment), "development")
    error_message = "'dev' must translate to 'development'"
  }
  assert {
    condition     = contains(keys(output.environment), "ephemeral")
    error_message = "'eph' must translate to 'ephemeral'"
  }
  assert {
    condition     = contains(keys(output.environment), "feature")
    error_message = "'fet' must translate to 'feature'"
  }
  assert {
    condition     = contains(keys(output.environment), "hotfix")
    error_message = "'hot' must translate to 'hotfix'"
  }
  assert {
    condition     = contains(keys(output.environment), "integration-testing")
    error_message = "'int' must translate to 'integration-testing'"
  }
  assert {
    condition     = contains(keys(output.environment), "penetration-testing")
    error_message = "'pen' must translate to 'penetration-testing'"
  }
  assert {
    condition     = contains(keys(output.environment), "performance-testing")
    error_message = "'per' must translate to 'performance-testing'"
  }
  assert {
    condition     = contains(keys(output.environment), "production")
    error_message = "'prd' and 'prod' must translate to 'production'"
  }
  assert {
    condition     = contains(keys(output.environment), "regression-testing")
    error_message = "'reg' must translate to 'regression-testing'"
  }
  assert {
    condition     = contains(keys(output.environment), "staging")
    error_message = "'stg' must translate to 'staging'"
  }
  assert {
    condition     = contains(keys(output.environment), "system-testing")
    error_message = "'sys' must translate to 'system-testing'"
  }
  assert {
    condition     = contains(keys(output.environment), "testing")
    error_message = "'tst' must translate to 'testing'"
  }
  assert {
    condition     = contains(keys(output.environment), "user-acceptance-testing")
    error_message = "'uat' must translate to 'user-acceptance-testing'"
  }
}

run "duplicate_tags_collapse_to_single_environment" {
  command = apply

  variables {
    # 'prd' and 'prod' both translate to 'production'
    environment_tags = ["prd", "prod"]
  }

  assert {
    condition     = length(keys(output.environment)) == 1
    error_message = "'prd' and 'prod' both map to 'production' and should collapse to a single environment key; got ${length(keys(output.environment))}"
  }
}
