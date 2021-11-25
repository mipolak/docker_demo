FROM docker.io/library/python:3

WORKDIR /usr/src/app

COPY ./src .
COPY requirements.txt ./
RUN  \
    apt autoremove -y && \
    apt update && \

CMD [ "python", "./main.py" ]

EXPOSE 8080/tcp
