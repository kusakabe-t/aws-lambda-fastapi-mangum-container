# Customイメージを利用したサンプル
```shell
Docker version 24.0.5
```

## ビルド
```shell
docker build --platform linux/amd64 --provenance=false -t fastapi-mangum-custom-container-sample .
```

## lambda-rieのインストール
```shell
mkdir -p ~/.aws-lambda-rie && \
    curl -Lo ~/.aws-lambda-rie/aws-lambda-rie https://github.com/aws/aws-lambda-runtime-interface-emulator/releases/latest/download/aws-lambda-rie && \
    chmod +x ~/.aws-lambda-rie/aws-lambda-rie
```

cf. https://github.com/aws/aws-lambda-python-runtime-interface-client

## ローカルテスト
```shell
docker run -p 9000:8080 fastapi-mangum-custom-container-sample 
```

```shell
$ curl -X "POST" "http://localhost:9000/2015-03-31/functions/function/invocations" \
-H 'Content-Type: application/json; charset=utf-8' \
-d $'{
  "path": "/test1",
  "requestContext": {},
  "httpMethod": "GET",
  "multiValueQueryStringParameters": {}
}'

{"isBase64Encoded": false, "statusCode": 200, "headers": {"content-length": "18", "content-type": "application/json"}, "body": "{\"message\":\"test\"}"}
```

```shell
$ curl -X "POST" "http://localhost:9000/2015-03-31/functions/function/invocations" \
-H 'Content-Type: application/json; charset=utf-8' \
-d $'{
  "path": "/test2",
  "requestContext": {},
  "httpMethod": "POST",
  "multiValueQueryStringParameters": {}
}'

{"isBase64Encoded": false, "statusCode": 200, "headers": {"content-length": "19", "content-type": "application/json"}, "body": "{\"message\":\"test2\"}"}
```

```shell
curl -X "POST" "http://localhost:9000/2015-03-31/functions/function/invocations" \
-H 'Content-Type: application/json; charset=utf-8' \
-d $'{
  "path": "/test3",
  "requestContext": {},
  "httpMethod": "POST",
  "multiValueQueryStringParameters": {
    "message": "hoge"
  }
}'

{"isBase64Encoded": false, "statusCode": 200, "headers": {"content-length": "18", "content-type": "application/json"}, "body": "{\"message\":\"hoge\"}"}
```

## デプロイ
```shell
aws ecr get-login-password --region ap-northeast-1 --profile default | docker login --username AWS --password-stdin <aws_account_id>.dkr.ecr.ap-northeast-1.amazonaws.com 
```

```shell
docker tag <image_id> <aws_account_id>.dkr.ecr.ap-northeast-1.amazonaws.com/voicevox-lambda
```
