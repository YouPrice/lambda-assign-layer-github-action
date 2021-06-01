#!/bin/sh 

set -e

mkdir -p ~/.aws

touch ~/.aws/credentials

echo "[default]
aws_access_key_id = ${AWS_ACCESS_KEY_ID}
aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}" > ~/.aws/credentials

# comando per assegnare layer alla funzione lambda

aws lambda update-function-configuration \
  --function-name ${LAYER_NAME} \
  --layers ${AWS_LAMBDA_ARN} \
  --region ${AWS_REGION}

rm -rf ~/.aws

