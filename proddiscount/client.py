from __future__ import print_function
import logging

import grpc

import discounts_pb2
import discounts_pb2_grpc

def run():
   with grpc.insecure_channel('localhost:50051') as channel:
      stub = discounts_pb2_grpc.DiscountsStub(channel)
      response = stub.Discount(discounts_pb2.DiscountRequest(idprod=1, iduser=2))
      print(response)

if __name__ == '__main__':
   logging.basicConfig()
   run()
