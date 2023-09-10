#!/bin/sh
if [ -z "${AWS_LAMBDA_RUNTIME_API}" ]; then
  docker run -v ~/.aws-lambda-rie:/aws-lambda -p 9000:8080 --entrypoint /aws-lambda/aws-lambda-rie fastapi-mangum-custom-container-sample /usr/local/bin/python -m awslambdaric app.handler
else
  echo "please install aws-lambda-rie. \ncf. https://github.com/aws/aws-lambda-python-runtime-interface-client#local-testing"
fi
