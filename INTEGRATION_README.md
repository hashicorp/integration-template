## Start with H2's

We generate the H1 for your integration in HashiCorp Developer, which will be the `integration.name` as specified in the `metadata.hcl` file.

We support [GitHub Flavored Markdown](https://github.github.com/gfm/) rendering, so you are free to leverage markdown within this document.

```go
package main

import "fmt"

func main() {
	fmt.Println("hello world")
}
```

## Linking to Component Pages

You may find the need to link to a component page from this README.

To do this, you must include a link following the path structure as exists in HashiCorp developer.

For example, to link to the `template-task` as configured in our `metadata.hcl` file, we will need to link to it like this:

Check out the [Template Task](/waypoint/integrations/hashicorp/integration-template/latest/components/task/template-task) for more details.
