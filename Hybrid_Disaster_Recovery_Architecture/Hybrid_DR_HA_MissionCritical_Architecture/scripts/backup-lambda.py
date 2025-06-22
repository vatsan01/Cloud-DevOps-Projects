import boto3
import json
import datetime

def lambda_handler(event, context):
    backup_client = boto3.client('backup')
    response = backup_client.start_backup_job(
        BackupVaultName='Default',
        ResourceArn='arn:aws:ec2:region:account-id:volume/volume-id',  # Update with real ARN
        IamRoleArn='arn:aws:iam::account-id:role/service-role/AWSBackupDefaultServiceRole',
        IdempotencyToken=str(datetime.datetime.now())
    )
    return {
        'statusCode': 200,
        'body': json.dumps('Backup job triggered successfully!')
    }
