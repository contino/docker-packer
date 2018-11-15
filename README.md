# Docker Packer
Containerised Packer with Python3 and AWS sdks installed.

## Usage
Run as a command:

    docker run --rm contino/packer

Run as a shell and mount current directory as volumes:

    docker run --rm -it -v ~/.aws:/root/.aws -v $(pwd):/opt/app --entrypoint bash contino/packer 

Using docker-compose:

    packer:
        image: contino/packer
        env_file: .env
        working_dir: /opt/app
        entrypoint: packer
        volumes:
          - .:/opt/app:rw
          - ${SSH_AUTH_SOCK}:${SSH_AUTH_SOCK}

And run:

    docker-compose run packer

## Build
Update the PACKER_VERSION` in both `Makefile` and `DockerFile`. The run:

    make build

Docker Hub will automatically triger a new build.

## Related Projects

- [docker-terraform](https://github.com/contino/docker-terraform)
- [docker-aws-cli](https://github.com/contino/docker-aws-cli)
