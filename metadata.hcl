# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

integration {
  name = "Integration Template"
  description = "This is an integration template"
  identifier = "waypoint/hashicorp/integration-template"
  flags = [ "archived" ]
  docs {
    process_docs = true
    # We recommend using the default readme_location of just `./README.md` here
    # This projects README needs to document the interface of an integration.
    #
    # If you need a separate README from what you will display on GitHub vs
    # what is shown on HashiCorp Developer, this is totally valid, though!
    readme_location = "./INTEGRATION_README.md"
    external_url = "https://github.com/hashicorp/integration-template"
  }
  license {
    type = "MPL-2.0"
    url = "https://github.com/hashicorp/integration-template/blob/main/LICENSE.md"
  }
  component {
    type = "platform"
    name = "Template Platform"
    slug = "template-platform"
  }
  component {
    type = "task"
    name = "Template Task"
    slug = "template-task"
  }
  component {
    type = "task"
    name = "Another Task"
    slug = "another-task"
  }
}
