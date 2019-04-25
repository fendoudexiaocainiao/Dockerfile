FROM alpine:latest
MAINTAINER wanghao<wh564546239@gmail.com>

COPY glibc-2.29-r0.apk /
ADD jre-8u192-linux-x64.tar.gz /usr/local

RUN echo https://mirrors.aliyun.com/alpine/latest-stable/main > /etc/apk/repositories && \
    echo https://mirrors.aliyun.com/alpine/latest-stable/community >> /etc/apk/repositories && \
    apk update upgrade && \
    apk add --allow-untrusted glibc-2.29-r0.apk && \
    rm -rf ./gilibc-2.29-r0.apk

ENV JAVA_HOME=/usr/local/jre1.8.0_192
ENV CLASSPATH=.:${JAVA_HOME}/lib/tools.jar:${JAVA_HOME}/lib/dt.jar
ENV PATH=.:${JAVA_HOME}/bin:${PATH}

CMD ["java","-version"]



