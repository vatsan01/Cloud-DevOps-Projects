import json
import boto3
import os

sns = boto3.client('sns')
SNS_TOPIC_ARN = os.environ.get('SNS_TOPIC_ARN')

def lambda_handler(event, context):
    s3 = boto3.client('s3')

    for record in event['Records']:
        bucket = record['s3']['bucket']['name']
        key = record['s3']['object']['key']

        response = s3.get_object(Bucket=bucket, Key=key)
        log_data = response['Body'].read().decode('utf-8')

        errors = [line for line in log_data.splitlines() if 'ERROR' in line.upper()]
        if errors:
            message = f"Error(s) found in log file: {key}\n\n" + "\n".join(errors[:10])
            sns.publish(
                TopicArn=SNS_TOPIC_ARN,
                Message=message,
                Subject="ALERT: Error detected in logs"
            )

    return {
        'statusCode': 200,
        'body': json.dumps('Log processed successfully.')
    }
