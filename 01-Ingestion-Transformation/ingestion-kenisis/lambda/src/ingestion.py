import json
import boto3
import random
import time


def put_records_into_kinesis(stream_name, records):
    # Create an instance of the Kinesis client with your AWS credentials
    aws_access_key_id = 'YOUR_ACCESS_KEY_ID'
    aws_secret_access_key = 'YOUR_SECRET_ACCESS_KEY'
    aws_region = 'us-east-1'  # Update with your AWS region

    kinesis = boto3.client('kinesis',
                           aws_access_key_id=aws_access_key_id,
                           aws_secret_access_key=aws_secret_access_key,
                           region_name=aws_region)

    for record in records:
        response = kinesis.put_record(
            StreamName=stream_name,
            Data=json.dumps(record),
            PartitionKey='partition_key'
        )
        print(f"Put record: {json.dumps(record)}")


def generate_sample_data(num_records):
    records = []
    for _ in range(num_records):
        data = {
            'attribute1': random.randint(1, 100),
            'attribute2': random.choice(['value1', 'value2', 'value3']),
            'attribute3': random.random() * 100
        }
        records.append(data)
    return records


def main():
    stream_name = 'my-kinesis-stream'  # Update with your stream name
    num_records = 10  # Number of records to put into Kinesis

    records = generate_sample_data(num_records)
    put_records_into_kinesis(stream_name, records)


if __name__ == "__main__":
    main()
