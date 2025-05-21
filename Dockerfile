
#FROM python:3.10.8-slim-buster

#RUN apt update && apt upgrade -y
#RUN apt install git -y
#COPY requirements.txt /requirements.txt

#RUN cd /
#RUN pip3 install -U pip && pip3 install #-U -r requirements.txt
#RUN mkdir /MJ_FILTER_BOT
#WORKDIR /MJ_FILTER_BOT
#COPY start.sh /start.sh
#CMD ["/bin/bash", "/start.sh"]


FROM python:3.10.8-slim-buster

RUN apt update && apt upgrade -y && apt install -y git curl

COPY requirements.txt /requirements.txt
RUN pip install -U pip && pip install -r /requirements.txt

WORKDIR /MJ_FILTER_BOT
COPY . .

RUN chmod +x start.sh

HEALTHCHECK --interval=30s --timeout=10s --start-period=20s --retries=3 \
  CMD curl -f http://localhost:8000/healthz || exit 1

CMD ["/bin/bash", "/start.sh"]
