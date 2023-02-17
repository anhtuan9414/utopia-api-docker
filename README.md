
![logo](logo.jpg)

## build image

```bash
git clone https://github.com/Sagleft/utopia-api-docker && cd utopia-api-docker
docker build . --tag utopia-api
```

The first time you start the container, a new account file will be created.

The following parameters are available to work with the API:
* API port: `22825`
* API protocol: `http`
* API token: `FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF`

Alternative to using docker image: use the simple U for Ubuntu [installation script](https://gist.github.com/Sagleft/06b53576c0b763f77e4d38e15e28b023)
