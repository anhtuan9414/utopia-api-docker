
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

also you can add optional param `--restart=always` to auto-restart container.

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
* API websocket port: `25000`
* API protocol: `http`
* API token: `FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF`

Alternative to using docker image: use the simple U for Ubuntu [installation script](https://gist.github.com/Sagleft/06b53576c0b763f77e4d38e15e28b023)

## If you want to use an existing account

Then build the image, change the config file, and then put the account file inside the container.

Step 1: build the image & create a container:

```bash
docker build -t utopia .
docker create --name utopia --memory=1024m --memory-reservation=256m uto9234/utopia-api
```

Step 2: update `utopia.cfg`: set account password. By default: `password`.

Step 3: copy account to container:

```bash
docker cp ./account.db utopia:/app/account.db
```

where:
* `./account.db` - the path to the account on the machine. in this example, the path to the file in the current folder;
* `utopia` - image name.

*NOTE: it is recommended to clear the account file before using it if it was actively used in the GUI client before. This can be done through the menu item "File" -> "Export Database..."*

### how to prevent log memory shortages

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

then restart docker daemon to apply changes

```
systemctl restart docker
```

or you can setup cron:

```
*/5 * * * * truncate -s 1m /var/lib/docker/containers/*/*-json.log
```


## useful links

* [Forum thread](https://talk.u.is/viewtopic.php?pid=5243#p5243)
* [UDocs](https://udocs.gitbook.io/utopia-api/)
