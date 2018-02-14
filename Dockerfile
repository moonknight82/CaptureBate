FROM python:2-alpine3.7
RUN apk update
RUN apk add  git gcc musl-dev linux-headers libxslt-dev libxml2-dev --no-cache
RUN pip install streamlink
RUN git clone https://github.com/bzsklb/CaptureBate /root/capturebate
RUN cd /root/capturebate && pip install -r requirements.txt
RUN apk del git gcc musl-dev --no-cache
RUN rm -Rf /tmp/*
CMD cd /root/capturebate && python main.py
