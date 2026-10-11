resource "google_healthcare_consent_store_iam_binding" "healthcare_consent_store_iam_bindings" {
  for_each = var.healthcare_consent_store_iam_bindings

  consent_store_id = each.value.consent_store_id
  dataset          = each.value.dataset
  members          = each.value.members
  role             = each.value.role

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

