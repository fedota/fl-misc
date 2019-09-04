#!/bin/bash -e

protodir=../fl-proto
client_gen=../fl-client
server_gen=../fl-server/genproto

python3 -m grpc_tools.protoc -I=$protodir --python_out=$client_gen --grpc_python_out=$client_gen $protodir/fl_round/fl_round.proto

if [ ! -d $server_gen ]; then
    mkdir $server_gen;
fi

protoc --go_out=plugins=grpc:$server_gen -I $protodir $protodir/fl_round/fl_round.proto