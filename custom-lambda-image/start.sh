#!/bin/sh
if [ -z "${AWS_LAMBDA_RUNTIME_API}" ]; then
  docker run -v ~/.aws-lambda-rie:/aws-lambda -p 9000:8080 --entrypoint /aws-lambda/aws-lambda-rie fastapi-mangum-custom-container-sample /usr/local/bin/python -m awslambdaric app.handler
else
  echo "please install aws-lambda-rie. \ncf. https://docs.aws.amazon.com/ja_jp/lambda/latest/dg/images-test.html#images-test-add"
fi
