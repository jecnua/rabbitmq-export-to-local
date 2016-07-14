#!/bin/bash

RABBIT_NAME='my-rabbit'

docker run -d \
  --hostname $RABBIT_NAME \
  --name $RABBIT_NAME \
  -p 5672:5672 \
  -p 15672:15672 \
  -v $PWD/mnesia:/var/lib/rabbitmq/mnesia/rabbit@$RABBIT_NAME \
  rabbitmq:3-management
