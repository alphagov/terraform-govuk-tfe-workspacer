data "tfe_variable_set" "vs" {
  for_each = toset(var.variable_set_names)

  name         = each.value
  organization = var.organization
}

resource "tfe_workspace_variable_set" "vs" {
  for_each = data.tfe_variable_set.vs

  variable_set_id = each.value.id
  workspace_id    = tfe_workspace.ws.id
}

resource "tfe_workspace_variable_set" "vs_ids" {
  count = length(var.variable_set_ids)

  variable_set_id = var.variable_set_ids[count.index]
  workspace_id    = tfe_workspace.ws.id
}
