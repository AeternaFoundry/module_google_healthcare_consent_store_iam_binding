variable "healthcare_consent_store_iam_bindings" {
  description = <<EOT
Map of healthcare_consent_store_iam_bindings, attributes below
Required:
    - consent_store_id
    - dataset
    - members
    - role
Optional:
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    consent_store_id = string
    dataset          = string
    members          = set(string)
    role             = string
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

