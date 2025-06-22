# Failover Runbook

## Objective
To simulate an AZ-level failure and test system resilience and auto-recovery.

## Steps
1. Identify and stop an EC2 instance in the active AZ.
2. Wait for Auto Scaling to trigger a replacement.
3. Verify load balancer health checks.
4. Validate service availability via CloudWatch and Prometheus metrics.
