#!/bin/bash -e
set -e

protodir=../fl-proto
client_gen=../fl-client
webserver_gen=../fl-webserver
server_gen=../fl-server/genproto
selector_gen=../fl-selector/genproto
coordinator_gen=../fl-coordinator/genproto

coordinator_gen=../fl-coordinator/genproto
selector_gen=../fl-selector/genproto

echo "Compiling to $client_gen"
python3 -m grpc_tools.protoc -I=$protodir --python_out=$client_gen --grpc_python_out=$client_gen $protodir/fl_round/fl_round.proto

echo "Compiling to $webserver_gen"
python3 -m grpc_tools.protoc -I=$protodir --python_out=$webserver_gen --grpc_python_out=$webserver_gen $protodir/fl_status/fl_status.proto

if [ ! -d $selector_gen ]; then
    mkdir $selector_gen;
fi
echo "Compiling to $selector_gen"
protoc --go_out=plugins=grpc:$selector_gen -I $protodir $protodir/fl_intra/fl_intra.proto
protoc --go_out=plugins=grpc:$selector_gen -I $protodir $protodir/fl_round/fl_round.proto

if [ ! -d $coordinator_gen ]; then
    mkdir $coordinator_gen;
fi
echo "Compiling to $coordinator_gen"
protoc --go_out=plugins=grpc:$coordinator_gen -I $protodir $protodir/fl_intra/fl_intra.proto
protoc --go_out=plugins=grpc:$coordinator_gen -I $protodir $protodir/fl_status/fl_status.proto
