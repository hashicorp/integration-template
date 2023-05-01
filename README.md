# Integration Template

This is a template repository for creating a new Integration for a HashiCorp product.

After your integration is ready & fully configured, you will need to submit a PR to the https://github.com/hashicorp/integrations repository to register your integration.

> Note: The integrations repository is in a closed-beta. We are currently working with integration partners directly, and we plan to open source the integrations registry in the future.

## Metadata Configuration

You will need to edit the [metadata.hcl](/metadata.hcl) file in the root of this repository.

### Fields

- `name` (required): The name of the integration
- `description` (required): A short description of the integration.
- `identifier` (required): The location in the [hashicorp/integrations](https://github.com/hashicorp/integrations) repo where your integration is registered (e.g. `waypoint/hashicorp/docker`).
- `integration_type` (optional): The type of the integration. There is an enumerated list of valid integration types on a per-product basis that can be found in the integration config in hashicorp/integrations ([example](https://github.com/hashicorp/integrations/blob/main/nomad/_config.hcl)). Some products do not support any types.
- `license` (optional): An object describing how the plugin is licensed.
  - `type` (optional): The license type
  - `url` (optional): A URL that points to the full license
- `flags` (optional): An array of conditional flags. A list of valid flags can be found [here](https://github.com/hashicorp/integrations/blob/main/flags.hcl).
- `docs` (optional): An object describing the docs setup

  - `process_docs`: (optional, default true): true if this integration has README docs that we want to render in HashiCorp Developer, false otherwise. If false, `external_url` is required.
  - `readme_location`: (optional, default ./README.md): The location of the README file. Ignored if `process_docs` is false.
  - `external_url`: (optional, default null): The URL of any external documentation / information about the integration. This can be specified regardless of how `process_docs` is configured. If `process_docs` is false, this will be where clicking on the integration card in the integration library will take you. If `process_docs` is true, there will be a link on the integration landing page to view the external URL.
- `component`: An object representing a component of the integration.
  - `type` (required): The component type. There is an enumerated list of valid components on a per-product basis that can be found in the integration config in hashicorp/integrations ([example](https://github.com/hashicorp/integrations/blob/main/waypoint/_config.hcl)). This value must be the slug of one of those components.
  - `name` (required): The name of your component.
  - `slug` (required): The slug of the component, used to determine the component page URL in HashiCorp Developer.

### metadata.hcl Examples

#### Minimal Configuration

This is a minimal configuration filling out only the required fields.

This will default to the README at the root of the repo to be processed.

```hcl
integration {
  name = "Cool Packer Integration"
  description = "A simple integration that shows how cool Packer is."
  identifier = "packer/hashicorp/cool-packer-integration"
  component {
    type = "builder"
    name = "Cool Builder"
    slug = "cool-builder"
  }
}
```

#### External URL Only

If you would like to opt-out of docs for your integration appearing on [HashiCorp Developer](https://developer.hashicorp.com/), you can specify this in the docs block.

Your integration will still appear on HashiCorp Developer when users are searching for integrations, but whenever it is clicked it will take you to whatever location you specify in the `external_url` path.

```hcl
integration {
  name = "Cool Packer Integration"
  description = "A simple integration that shows how cool Packer is."
  identifier = "packer/hashicorp/cool-packer-integration"
  docs {
    process_docs = false
    external_url = "https://example.com/cool-packer-integration"
  }
  component {
    type = "builder"
    name = "Cool Builder"
    slug = "cool-builder"
  }
}
```

## Triggering Releases

Whenever you have made significant updates to your integration, you must notify us via a provided GitHub Actions for us to fetch your updates & reflect them on HashiCorp Developer. Releases can be made via the GitHub Actions specified below.

After registering your integration in [hashicorp/integrations](https://github.com/hashicorp/integrations), you must first trigger an initial release before appearing on HashiCorp Developer.

Releases must follow Semver (`X.X.X` for proper releases, `X.X.X-abc` for pre-releases). Proper releases will be navigatable in HashiCorp Developer by end-users. Pre-releases are only navigatable via directly going to the URL. This may be useful for previewing what a release will look like on the website before properly making a release.

To update an old release, you can trigger the Notify Release workflow on the same Semver and we will overwrite the old release. This may be useful for fixing typos, making small adjustments, etc.

### GitHub Action

There is a GitHub Action provided that will enable you to notify our integrations registry that there is a new release for your integration available.

> NOTE: You must update the provided GitHub Actions and give them the proper `integration_identifier`, which is identical to the `identifier` key in the HCL file.

We have two GitHub workflows provided that leverage this action.

#### [Notify Integration Release via GitHub Actions UI](.github/workflows/notify-release-via-manual.yaml)

This is a predefined workflow that will allow you to trigger the Notify Release action manually from the UI.

![Screenshot of Action Triggere from UI](https://user-images.githubusercontent.com/2105067/195161825-8a1fb3f1-7c58-4c88-8e1d-d6bc45d479af.png)

#### [Notify Integration Release via Git Tag](.github/workflows/notify-release-via-tag.yaml)

This is a predefined workflow that will allow you to trigger the Notify Release action from a new git tag.
