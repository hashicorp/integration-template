# This file simulates the entry that would be PR'd into
# hashicorp/integrations, which would correspond to **THIS**
# repository.
# 
# This is for previewing your integration locally (via `docker compose`)
# before submitting a PR to register an integration within hashicorp/integrations.

remote_integration {
  # this is an arbitrary uuid, only used for demo purposes
  id = "ead32ac0-49df-4664-ac06-49ce39f7a2f0"
  # adjust accordingly
  repo_url = "https://github.com/owner/repo"
  # official | community | partner
  tier = "community"
}