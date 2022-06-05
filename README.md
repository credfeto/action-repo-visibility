# action-repo-visibility

Checks the github repository's visibility to see if it is public or private so that the workflow can be customised
and enable tasks that should only occur on public or private repos.

## How to use it?
This is a Github action, so it has to be added to a github workflow.

A simple example of running this action on all pushes to the repository would be
add a `visibility.yml` file under `.github/workflows` with the following content.

```yamlstatus
name: Test Workflow

on:
  [push]

jobs:
  test:

    runs-on: ubuntu-latest

    steps:
      - uses: credfeto/action-repo-visibility@main
        id: visibility
        with: 
          # optional parameter defaults to the current repo
          repository: ${{ github.repository }}
          # optional parameter defaults to the current user
          token: ${{ github.token }}

      - if: ${{ steps.visibility.outputs.is_public == 'true' }}
        run: echo "Repo is Public"
        # Run additional tasks that are required for public repos
        # e.g. alerting that the repo is public when it should not be

      - if: ${{ steps.visibility.outputs.is_private == 'true' }}
        run: echo "Repo is PRIVATE"
        # Run additional steps that are only required on private repos

      - run: echo "Status ${{ steps.visibility.outputs.status }}"
      - run: echo "Public ${{ steps.visibility.outputs.is_public }}"
      - run: echo "Private ${{ steps.visibility.outputs.is_private }}"
```

## Changelog

See [CHANGELOG](CHANGELOG.md) for history