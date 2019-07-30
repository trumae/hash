all: python go 

python: discounts.proto
	python3 -m grpc_tools.protoc -I. --python_out=../proddiscount/ --grpc_python_out=../proddiscount/ discounts.proto 

go: discounts.proto
	protoc -I . discounts.proto --go_out=plugins=grpc:../prodlist/discounts
