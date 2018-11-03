#!/usr/bin/env bash

echo "### Start shoryuken ###"

mkdir -p ./tmp/pids
if [ $RAILS_ENV = 'development' ] ; then
  bundle exec rake shoryuken:initialize_queue
fi

bundle exec shoryuken --rails --config ./config/shoryuken.yml
