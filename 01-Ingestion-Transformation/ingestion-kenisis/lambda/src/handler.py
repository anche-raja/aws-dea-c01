import json
import boto3
import random
import time


def lambda_handler(event, context):
    kinesis = boto3.client('kinesis')
    stream_name = 'my-kinesis-stream'  # Update with your stream name

    while True:
        data = {
            'attribute1': random.randint(1, 100),
            'attribute2': random.choice(['value1', 'value2', 'value3']),
            'attribute3': random.random() * 100
        }

        response = kinesis.put_record(
            StreamName=stream_name,
            Data=json.dumps(data),
            PartitionKey='partition_key'
        )

        print(f"Put record: {json.dumps(data)}")
        time.sleep(1)  # Adjust as needed
