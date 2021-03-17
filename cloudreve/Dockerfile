FROM xavierniu/cloudreve
MAINTAINER qics
RUN apk add python2 && apk add yasm && apk add ffmpeg
RUN wget -P /tmp https://bootstrap.pypa.io/pip/2.7/get-pip.py
RUN python /tmp/get-pip.py
RUN pip install pysqlite3
RUN wget -P /cloudreve http://www.qics.top/cloudreve/convert2mp4.py
RUN rm -fr /cloudreve/entrypoint.sh
RUN wget -P /cloudreve http://www.qics.top/cloudreve/entrypoint.sh
RUN chmod +x /cloudreve/entrypoint.sh
RUN rm -fr /tmp/*
EXPOSE 5212
