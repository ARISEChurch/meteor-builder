# meteor-builder

An ONBUILD docker image for building other docker images


## Usage

`Dockerfile.build`
```dockerfile
FROM arisechurch/meteor-builder:latest
```

`Dockerfile`
```dockerfile
FROM ddipward/tinymeteor:latest

ADD build/bundle /bundle

ENTRYPOINT ["node", "/bundle/main.js"]
```

The idea is to build a builder image that contains the correct meteor
distribution for your app, which is then used to create the Meteor bundle.

The bundle is then installed into a minimal node image called
`ddipward/tinymeteor` which means we can create images around 70mb in size!

```sh
# Create the meteor builder
docker build -f Dockerfile.build -t temp-builder .
# Actually create the meteor bundle
docker run --rm -v $PWD:/app" temp-builder
# Put the bundle in a lightweight node container
docker build -t my-image .
# Push our runnable image to a registry
docker push my-image
```
