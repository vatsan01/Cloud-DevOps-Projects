#!/bin/bash

TOPIC_NAME="LogErrorAlerts"
EMAIL="<your-email@example.com>"

# Create SNS topic
aws sns create-topic --name $TOPIC_NAME

# Get topic ARN
TOPIC_ARN=$(aws sns list-topics --query "Topics[?contains(TopicArn, '$TOPIC_NAME')].TopicArn" --output text)

# Subscribe email
aws sns subscribe --topic-arn $TOPIC_ARN --protocol email --notification-endpoint $EMAIL

echo "SNS Topic created and subscription email sent to $EMAIL"
echo "Topic ARN: $TOPIC_ARN"
