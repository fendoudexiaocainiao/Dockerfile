FROM registry.cn-hangzhou.aliyuncs.com/wanghao0921/oracle-jdk:8u192
MAINTAINER wanghao<wh564546239@gmail.com>

COPY start.sh /apollo-service
COPY apollo-all-in-one.jar /apollo-service
COPY apollo-service.conf /apollo-service

RUN apk add --no-cache bash && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&  \
    echo "Asia/Shanghai" > /etc/timezone && \
    mkdir /apollo-service/logs && \
    touch /apollo-service/logs/apollo-service.log && \
    chmod -R 777 /apollo-service

ENV APOLLO_CONFIG_DB_URL=jdbc:mysql://mysql:3306/ApolloConfigDB?characterEncoding=utf8
ENV APOLLO_CONFIG_DB_USERNAME=root
ENV APOLLO_CONFIG_DB_PASSWORD=123456

EXPOSE 8080 8090

WORKDIR /apollo-service

CMD [ "./start.sh", "start" ]