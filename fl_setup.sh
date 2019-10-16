#!/bin/bash
set -e

server=https://github.com/omkarprabhu-98/fl-server
client=https://github.com/pvgupta24/fl-client
proto=https://github.com/pvgupta24/fl-proto
selector=https://github.com/ShashankP19/fl-selector

cd ..

git clone $server
git clone $client
git clone $proto
git clone $selector

cd fl-misc
bash fl_proto.sh