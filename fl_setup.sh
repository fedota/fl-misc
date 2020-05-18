#!/bin/bash
set -e

# server=https://github.com/fedota/fl-server
client=https://github.com/fedota/fl-client
proto=https://github.com/fedota/fl-proto
selector=https://github.com/fedota/fl-selector
coordinator=https://github.com/fedota/fl-coordinator
webserver=https://github.com/fedota/fl-webserver
fedotaInfra=https://github.com/fedota/fedota-infra

cd ..

# git clone $server
git clone $client
git clone $proto
git clone $selector
git clone $coordinator
git clone $webserver
git clone $fedotaInfra

cd fl-misc
bash fl_proto.sh