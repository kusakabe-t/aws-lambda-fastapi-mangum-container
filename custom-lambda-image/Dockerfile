FROM python:3.11

WORKDIR /function

COPY app.py requirements.txt ./

RUN pip install -r ./requirements.txt

ENTRYPOINT [ "/usr/local/bin/python", "-m", "awslambdaric" ]

CMD ["app.handler"]
