# publish-docker
Action for creating, tagging and pushing docker containers

## usage
```yaml
jobs:
  test:
    name: Upload Docker image to Docker repo
    # Set the agent to run on
    runs-on: ubuntu-latest

    steps:
    - name: Run publish-docker
        id: run-publish-docker
        uses: lucenelletenebre/publish-docker@main
        with:
          docker-context: . # OPTIONAL (folder with docker file)
          docker-registry: ghcr.io # OPTIONAL (docker registry)
          docker-platforms: linux/amd64,linux/arm64 # OPTIONAL (docker arch)
          docker-push: true # OPTIONAL (push image to registry)
          username: ${{ github.repository_owner }} # Docker repository username
          password: ${{ secrets.GITHUB_TOKEN }} # Docker repository password
          docker-image: ghcr.io/lucenelletenebre/test # Name of docker image
```

## Action output
The action output a version TAG calculated on your repository. You can call the output in other steps in this way:
```yaml
${{ steps.run-publish-docker.outputs.version-tag}}
```

