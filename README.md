# Import/Export tools

Yeah not the best but it works.
I'll get it better later.

# How to

Clone this repo
Build your image locally (don't want to push it anywhere for now)

    docker built -t jecnua/rabbitmq-export .

Run it

    docker run -it \
    -v $PWD/data:/data \
    jecnua/rabbitmq-export

Now pull down the data you need

    rabbitmq-dump-queue \
    -uri="amqp://<user>:<pass>@<url>:<port>/" \
    -queue=<queue_name> \
    -max-messages=2000 \
    -output-dir=/data

Check the results

    $ du -sh data/
    344M data/

### Notes on ubuntu 14.04

You need it to run as sudo or try to solve... a lot of problems:

- Are you trying to connect to a TLS-enabled daemon without TLS?

# dump all the messages in a directory

Mount a volume
