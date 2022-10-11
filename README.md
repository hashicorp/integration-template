# Integration Template

This is a template repository for creating a new Integration for a HashiCorp product.

After your integration is ready & fully configured, you will need to submit a PR to the https://github.com/hashicorp/integrations repository to register your integration.

## Metadata Configuration

You will need to edit the [metadata.hcl](/metadata.hcl) file in the root of this repository.

### Fields

- `name` (required): The name of the integration
- `description` (required): A short description of the integration.
- `identifier` (required): The location in the [hashicorp/integrations](https://github.com/hashicorp/integrations) repo where your integration is registered (e.g. `packer/my-plugin`).
- `license` (optional): An object describing how the plugin is licensed.
  - `type` (optional): The license type
  - `url` (optional): A URL that points to the full license
- `components` (required): An array of components that the integration has. There is an enumerated list of valid components on a per-product basis that can be found in the integration config in hashicorp/integrations ([example](https://github.com/hashicorp/integrations/blob/main/packer/_config.hcl))
- `flags` (optional): An array of conditional flags. A list of valid flags can be found [here](https://github.com/hashicorp/integrations/blob/main/flags.hcl).
- `docs` (optional): An object describing the docs setup
  - `process_docs`: (optional, default true): true if this integration has README docs that we want to render in HashiCorp Developer, false otherwise. If false, `external_url` is required.
  - `readme_location`: (optional, default ./README.md): The location of the README file.  Ignored if `process_docs` is false.
  - `external_url`: (optional, default null): The URL of any external documentation / information about the integration.  This can be specified regardless of how `process_docs` is configured.  If `process_docs` is false, this will be where clicking on the integration card in the integration library will take you.  If `process_docs` is true, there will be a link on the integration landing page to view the external URL.


### metadata.hcl Examples

#### Minimal Configuration

This is a minimal configuration filling out only the required fields.

```hcl
integration {
  name = "Cool Packer Integration"
  description = "A simple integration that shows how cool Packer is."
  identifier = "packer/cool-packer-integration"
  components = [ "builder" ]
}
```

This will default to the README at the root of the repo to be processed.

#### External URL Only

If you would like to opt-out of docs for your integration appearing on [HashiCorp Developer](https://developer.hashicorp.com/), you can specify this in the docs block.

Your integration will still appear on HashiCorp Developer when users are searching for integrations, but whenever it is clicked it will take you to whatever location you specify in the `external_url` path.

```hcl
integration {
  name = "Cool Packer Integration"
  description = "A simple integration that shows how cool Packer is."
  identifier = "packer/cool-packer-integration"
  components = [ "builder" ]
  docs {
    process_docs = false
    external_url = "https://example.com/cool-packer-integration"
  }
}
```

### GitHub Action

