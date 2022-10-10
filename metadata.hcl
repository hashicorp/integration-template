integration {
  name = "Integration Example"
  description = "This is an integration template"
  identifier = "packer/integration-template"
  components = [ "builder" ]
  flags = [ "archived" ]
  license {
    type = "MPL-2.0"
    url = "https://github.com/hashicorp/integration-template/blob/main/LICENSE"
  }
  docs {
    process_docs = true
    readme_location = "./README.md"
    external_url = "https://github.com/hashicorp/integration-template"
  }
}
