# RabbitMQ import/export scripts

The export tool is just a docker container around this tool [rabbitmq-dump-queue](https://github.com/dubek/rabbitmq-dump-queue).

Is not mine :)

## Prerequisites

- docker
- python 2.7 & pip
- pika

### Python dep

    $ sudo apt-get install python-pip
    $ pip install --user pika

## How to

Clone this repo
Build your image locally (don't want to push it anywhere for now)

    $ docker built -t jecnua/rabbitmq-export .

Run it

    $ docker run -it \
    -v $PWD/data:/data \
    jecnua/rabbitmq-export

Now pull down the data you need

    $ time rabbitmq-dump-queue \
    -uri="amqp://<user>:<pass>@<url>:<port>/" \
    -queue=<queue_name> \
    -max-messages=2000 \
    -output-dir=/data

Check the results

    $ du -sh data/
    344M data/

Now that you have the data, run RabbitMQ locally:

    $ ./rabbit_00_run_rabbit_locally.sh
    $ docker ps

As a last step push all the messages on the queue:

    $ time ./01_built_queue.py

### On ubuntu 14.04

You need it to run as sudo or try to solve... a lot of problems:

https://docs.docker.com/engine/installation/linux/ubuntulinux/

For example:

- Old packages
- Error: _Are you trying to connect to a TLS-enabled daemon without TLS?_

[link 1](https://stackoverflow.com/questions/29704059/docker-are-you-trying-to-connect-to-a-tls-enabled-daemon-without-tls)

[link 2](https://stackoverflow.com/questions/27528337/am-i-trying-to-connect-to-a-tls-enabled-daemon-without-tls)

[link 3](https://stackoverflow.com/questions/27978324/why-install-docker-on-ubuntu-should-be-sudo-apt-get-install-docker-io)

So I just run it as sudo -,-

## Notes

All the downloaded messages are saved in the *data* directory. The files are
under gitignore so no risk to expose them.
