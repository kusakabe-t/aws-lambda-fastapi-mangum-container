FROM public.ecr.aws/lambda/python:3.8

COPY app.py requirements.txt ./

RUN pip install -r ./requirements.txt

CMD ["app.handler"]
