#!/bin/bash
# Simulate failure in one AZ and verify ASG and ALB functionality

INSTANCE_ID=$(aws ec2 describe-instances --filters "Name=tag:Environment,Values=prod" --query "Reservations[].Instances[].InstanceId" --output text)
REGION="us-east-1"

echo "Stopping instance: $INSTANCE_ID"
aws ec2 stop-instances --instance-ids $INSTANCE_ID --region $REGION

echo "Waiting for Auto Scaling to replace instance..."
sleep 60

echo "Verifying ALB health checks..."
aws elbv2 describe-target-health --target-group-arn <your-target-group-arn> --region $REGION
