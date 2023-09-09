FROM python:3.11

WORKDIR /function

COPY app.py requirements.txt ./

RUN pip install -r ./requirements.txt
RUN pip install awslambdaric==2.0.7

ENTRYPOINT [ "/usr/local/bin/python", "-m", "awslambdaric" ]

CMD ["app.handler"]
