# owncloud-docker
Docker container running ownCloud

### Usage

    ~$ sudo docker build -t my-owncloud .
    ~$ sudo docker run -d -p 80:80 --entrypoint="/entrypoint.sh" my-owncloud

### Advanced Options

You can mount your `apps/` and `data/` folders as volumes like this:

    ~$ sudo docker run -d -p 80:80 -v /path/to/apps:/app/apps -v /path/to/data:/app/data --entrypoint="/entrypoint.sh" my-owncloud
