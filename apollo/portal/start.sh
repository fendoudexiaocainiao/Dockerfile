#!/bin/bash

base_java_opts="-Denv=dev"
portal_java_opts="$base_java_opts -Ddev_meta=$CONFIG_SERVER_URL -Dspring.profiles.active=github,auth"

portal_jar=./apollo-all-in-one.jar
portal_log=./logs/apollo-portal.log

if [ "$1" = "start" ] ; then
  echo "==== starting portal ===="
  echo "Portal logging file is $portal_log"
  export JAVA_OPTS="$portal_java_opts -Dlogging.file=$portal_log -Dserver.port=8070 -Dspring.datasource.url=$APOLLO_PORTAL_DB_URL -Dspring.datasource.username=$APOLLO_PORTAL_DB_USERNAME -Dspring.datasource.password=$APOLLO_PORTAL_DB_PASSWORD"
  $portal_jar start --portal

  rc=$?
  if [[ $rc != 0 ]];
  then
    echo "Failed to start portal, return code: $rc. Please check $portal_log for more information."
    exit $rc;
  fi

  printf "Waiting for portal startup"

  rc=$?
  if [[ $rc != 0 ]];
  then
    printf "\nPortal failed to start in $rc seconds! Please check $portal_log for more information.\n"
    exit 1;
  fi

  printf "\nPortal started!"

  tail -f $portal_log
elif [ "$1" = "stop" ] ; then
  echo "==== stopping service ===="
  $portal_jar stop
else
  echo "Usage: demo.sh ( commands ... )"
  echo "commands:"
  echo "  start         start portal"
  echo "  stop          stop portal"
  exit 1
fi