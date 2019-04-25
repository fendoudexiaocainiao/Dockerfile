FROM alpine:latest
MAINTAINER wanghao<wh564546239@gmail.com>

COPY glibc-2.29-r0.apk /
COPY jdk1.8.0_192.7z.001 /
COPY jdk1.8.0_192.7z.002 /
COPY jdk1.8.0_192.7z.003 /

RUN echo https://mirrors.aliyun.com/alpine/latest-stable/main > /etc/apk/repositories && \
    echo https://mirrors.aliyun.com/alpine/latest-stable/community >> /etc/apk/repositories && \
    apk update upgrade && \
    apk add --allow-untrusted glibc-2.29-r0.apk && \
    apk add p7zip && \
    7z x "jdk1.8.0_192.7z.*" -o/usr/local && \
    rm -rf ./gilibc-2.29-r0.apk ./jdk1.8.0_192.7z* && \
    chmod -R /usr/local/jdk1.8.0_192

ENV JAVA_HOME=/usr/local/jdk1.8.0_192
ENV CLASSPATH=.:${JAVA_HOME}/lib/tools.jar:${JAVA_HOME}/lib/dt.jar
ENV PATH=.:${JAVA_HOME}/bin:${PATH}

CMD ["java","-version"]



