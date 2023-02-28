
![logo](logo.jpg)

This docker image allows you to quickly and easily run Utopia client with the configured API and start working right away.

Ready image: `uto9234/utopia-api` [from docker hub](https://hub.docker.com/repository/docker/uto9234/utopia-api/general).

## run Utopia container

Create your first Utopia container from image:

```bash
docker pull uto9234/utopia-api
docker run --name utopia --memory=1024m --memory-reservation=256m --restart=always -it uto9234/utopia-api
```

*NOTE: `--memory=1024m` - optional parameter to set max RAM for container to 1gb. `--memory-reservation=200m` - min RAM for container*

or create container without running it:

```bash
docker create --name utopia --memory=1024m --memory-reservation=256m uto9234/utopia-api
```

run existing container:

```bash
docker container start utopia
```

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

### prevent log memory shortages

make the following changes to the file `/etc/docker/daemon.json`:

```
{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m",
    "max-file": "3"
  }
}
```

## useful links

* [Forum thread](https://talk.u.is/viewtopic.php?pid=5243#p5243)
* [UDocs](https://udocs.gitbook.io/utopia-api/)
