# RabbitMQ import/export scripts

The export tool is just a docker container around this tool [rabbitmq-dump-queue](https://github.com/dubek/rabbitmq-dump-queue).

Is not mine :)

# How to

Clone this repo
Build your image locally (don't want to push it anywhere for now)

    $ docker built -t jecnua/rabbitmq-export .

Run it

    $ docker run -it \
    -v $PWD/data:/data \
    jecnua/rabbitmq-export

Now pull down the data you need

    $ rabbitmq-dump-queue \
    -uri="amqp://<user>:<pass>@<url>:<port>/" \
    -queue=<queue_name> \
    -max-messages=2000 \
    -output-dir=/data

Check the results

    $ du -sh data/
    344M data/

Now that you have the data, run RabbitMQ locally:

    $./rabbit_00_run_rabbit_locally.sh

### On ubuntu 14.04

You need it to run as sudo or try to solve... a lot of problems:

- Old packages
- Error: _Are you trying to connect to a TLS-enabled daemon without TLS?_

So I just run it as sudo -,-

# Notes

All the downloaded messages are saved in the *data* directory. The files are
under gitignore so no risk to expose them.
