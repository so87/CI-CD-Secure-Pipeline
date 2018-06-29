FROM python:3
RUN apt-get update && apt-get upgrade -y && apt-get autoremove && apt-get autoclean
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN pip install -r requirements.txt
ADD . /code/
