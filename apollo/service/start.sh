#!/bin/bash

base_java_opts="-Denv=dev"
server_java_opts="$base_java_opts -Dspring.profiles.active=github -Deureka.service.url=$EUREKA_SERVICE_URL"

service_jar=./apollo-all-in-one.jar
service_log=./logs/apollo-service.log

if [ "$1" = "start" ] ; then
  echo "==== starting service ===="
  echo "Service logging file is $service_log"
  export JAVA_OPTS="$server_java_opts -Dlogging.file=$service_log -Dspring.datasource.url=$APOLLO_CONFIG_DB_URL -Dspring.datasource.username=$APOLLO_CONFIG_DB_USERNAME -Dspring.datasource.password=$APOLLO_CONFIG_DB_PASSWORD"
  $service_jar start --configservice --adminservice

  rc=$?
  if [[ $rc != 0 ]];
  then
    echo "Failed to start service, return code: $rc. Please check $service_log for more information."
    exit $rc;
  fi

  printf "Waiting for config service startup"

  rc=$?
  if [[ $rc != 0 ]];
  then
    printf "\nConfig service failed to start in $rc seconds! Please check $service_log for more information.\n"
    exit 1;
  fi

  printf "\nConfig service started. You may visit for service status now!\n"

  printf "Waiting for admin service startup"

  rc=$?
  if [[ $rc != 0 ]];
  then
    printf "\nAdmin service failed to start in $rc seconds! Please check $service_log for more information.\n"
    exit 1;
  fi

  printf "\nAdmin service started\n"
  tail -f $service_log
elif [ "$1" = "stop" ] ; then
  echo "==== stopping service ===="
  $service_jar stop
else
  echo "Usage: demo.sh ( commands ... )"
  echo "commands:"
  echo "  start         start services"
  echo "  stop          stop services"
  exit 1
fi