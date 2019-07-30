#!/bin/sh

echo "installing go grpc"
go get -u google.golang.org/grpc
go get -u github.com/golang/protobuf/protoc-gen-go

echo "installing python grpc"
sudo python3 -m pip install --upgrade pip
sudo pip3 install grpcio
sudo pip3 install grpcio-tools

echo "Processing proto"
cd protos
make
cd ..

echo "Compiling prodlist service (Go)"
cd prodlist
make
cd ..

echo "Building docker images"
sudo docker-compose build

