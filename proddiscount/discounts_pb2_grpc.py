# Generated by the gRPC Python protocol compiler plugin. DO NOT EDIT!
import grpc

import discounts_pb2 as discounts__pb2


class DiscountsStub(object):
  # missing associated documentation comment in .proto file
  pass

  def __init__(self, channel):
    """Constructor.

    Args:
      channel: A grpc.Channel.
    """
    self.Discount = channel.unary_unary(
        '/discounts.Discounts/Discount',
        request_serializer=discounts__pb2.DiscountRequest.SerializeToString,
        response_deserializer=discounts__pb2.DiscountReply.FromString,
        )


class DiscountsServicer(object):
  # missing associated documentation comment in .proto file
  pass

  def Discount(self, request, context):
    # missing associated documentation comment in .proto file
    pass
    context.set_code(grpc.StatusCode.UNIMPLEMENTED)
    context.set_details('Method not implemented!')
    raise NotImplementedError('Method not implemented!')


def add_DiscountsServicer_to_server(servicer, server):
  rpc_method_handlers = {
      'Discount': grpc.unary_unary_rpc_method_handler(
          servicer.Discount,
          request_deserializer=discounts__pb2.DiscountRequest.FromString,
          response_serializer=discounts__pb2.DiscountReply.SerializeToString,
      ),
  }
  generic_handler = grpc.method_handlers_generic_handler(
      'discounts.Discounts', rpc_method_handlers)
  server.add_generic_rpc_handlers((generic_handler,))
