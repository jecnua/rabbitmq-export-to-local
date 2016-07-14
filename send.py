#!/usr/bin/env python
import pika
import os

connection = pika.BlockingConnection(pika.ConnectionParameters(
        host='localhost'))
channel = connection.channel()
channel.queue_declare(queue='reindex')
dirs = os.listdir('data')
for file in dirs:
    txt = open('data/' + file)
    channel.basic_publish(exchange='',
                          routing_key='reindex',
                          body=txt.read())
    print(" [x] Sent " + file)
connection.close()
