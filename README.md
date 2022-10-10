# Integration Template

This is a template repository for creating a new Integration for a HashiCorp product.

## Configuration

### Metadata

You will need to edit the `metadata.hcl` file in the root of this repository.

- `name` (required): The name of the integration
- `description` (required): A short description of the integration.
- `license` (optional): An object describing how the plugin is licensed.
  - `type` (optional): The license type
  - `url` (optional): A URL that points to the full license
- `components` (required): An array of components that the integration has. There is an enumerated list of valid components on a per-product basis that can be found in the integration config in hashicorp/integrations ([example](https://github.com/hashicorp/integrations/blob/main/packer/_config.hcl))
- `flags` (optional): An array of conditional flags. A list of valid flags can be found [here](https://github.com/hashicorp/integrations/blob/main/flags.hcl).
- `docs` (optional): An object describing the docs setup
  - `process_docs`: (optional, default true): true if this integration has README docs that we want to render in HashiCorp Developer, false otherwise. If false, `external_url` is required.
  - `readme_location`: (optional, default ./README.md): The location of the README file.  Ignored if `process_docs` is false.
  - `external_url`: (optional, default null): The URL of any external documentation / information about the integration.  This can be specified regardless of how `process_docs` is configured.  If `process_docs` is false, this will be where clicking on the integration card in the integration library will take you.  If `process_docs` is true, there will be a link on the integration landing page to view the external URL.

### GitHub Action
