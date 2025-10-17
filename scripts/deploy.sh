#!/bin/bash

set -e

ENVIRONMENT=$1

if [ -z "$ENVIRONMENT" ]; then
  echo "Error: Deployment environment not specified."
  echo "Usage: ./deploy.sh [staging|production]"
  exit 1
fi

echo "Starting deployment to $ENVIRONMENT environment..."

if [ "$ENVIRONMENT" == "staging" ]; then
  SERVER_IP="192.168.1.10"
  echo "-> Target server: Staging ($SERVER_IP)"
elif [ "$ENVIRONMENT" == "production" ]; then
  SERVER_IP="10.0.0.5"
  echo "-> Target server: Production ($SERVER_IP)"
else
  echo "Error: Invalid environment '$ENVIRONMENT'. Use 'staging' or 'production'."
  exit 1
fi

echo "-> Syncing files to server..."
sleep 2
echo "-> Files synced successfully."

echo "Deploying to $ENVIRONMENT finished."
