#!/bin/bash -e
set -e

protodir=../fl-proto
client_gen=../fl-client
server_gen=../fl-server/genproto
selector_gen=../fl-selector/genproto
coordinator_gen=../fl-coordinator/genproto

coordinator_gen=../fl-coordinator/genproto
selector_gen=../fl-selector/genproto

echo "Compiling to $client_gen"
python3 -m grpc_tools.protoc -I=$protodir --python_out=$client_gen --grpc_python_out=$client_gen $protodir/fl_round/fl_round.proto

if [ ! -d $server_gen ]; then
    mkdir $server_gen;
fi
# echo "Compiling to $server_gen"
# protoc --go_out=plugins=grpc:$server_gen -I $protodir $protodir/fl_round/fl_round.proto


if [ ! -d $coordinator_gen ]; then
    mkdir $coordinator_gen;
fi
echo "Compiling to $coordinator_gen"
protoc --go_out=plugins=grpc:$coordinator_gen -I $protodir $protodir/fl_intra/fl_intra.proto

if [ ! -d $selector_gen ]; then
    mkdir $selector_gen;
fi
echo "Compiling to $selector_gen"
protoc --go_out=plugins=grpc:$selector_gen -I $protodir $protodir/fl_intra/fl_intra.proto
protoc --go_out=plugins=grpc:$selector_gen -I $protodir $protodir/fl_round/fl_round.proto
