# [Backstage](https://backstage.io)

This is your newly scaffolded Backstage App, Good Luck!

## Setup `app-config.local.yaml`



### Token for GitHub
Add a token to the [github integration](https://backstage.io/docs/getting-started/configuration#setting-up-a-github-integration)
```yaml
integrations:
  github:
  - host: github.com
    token: ${{ insertTokenHere }}
```
### Setup Oauth with github
```yaml
auth:
  # see https://backstage.io/docs/auth/ to learn about auth providers
  environment: development
  providers:
    github:
      development:
        clientId: ${{ insertClientIdHere }}
        clientSecret: ${{ insertClientSecretHere }}
```

### Setup the Template location
```yaml
catalog:
  locations:
  - type: file
    target: ../../templates/templates.yaml
    rules:
    - allow: [Templates, Template]
```
## Running Backstage locally

To start the app, run:

```sh
nix develop # or direnv allow
yarn install
yarn dev
```

## Templates

The Demo Template can be found [here](./templates/templates.yaml). As this grows, this could be its own repo and you would configure a remote `catalog.locations.[type].target`.
