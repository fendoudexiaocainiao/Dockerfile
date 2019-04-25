FROM registry.cn-hangzhou.aliyuncs.com/wanghao0921/oracle-jdk:8u192
MAINTAINER wanghao<wh564546239@gmail.com>

RUN apk add --no-cache bash && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&  \
    echo "Asia/Shanghai" > /etc/timezone && \
    mkdir /apollo-portal /apollo-portal/logs && \
    touch /apollo-portal/logs/apollo-portal.log

COPY start.sh /apollo-portal
COPY apollo-all-in-one.jar /apollo-portal
COPY apollo-portal.conf /apollo-portal

ENV APOLLO_PORTAL_DB_URL=jdbc:mysql://mysql:3306/ApolloPortalDB?characterEncoding=utf8
ENV APOLLO_PORTAL_DB_USERNAME=root
ENV APOLLO_PORTAL_DB_PASSWORD=123456
ENV CONFIG_SERVER_URL=http://apollo-service:8080

EXPOSE 8070

WORKDIR /apollo-portal

CMD [ "./start.sh", "start" ]