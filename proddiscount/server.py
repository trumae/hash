from concurrent import futures
import time
from datetime import date
import logging
import psycopg2
import logic
import grpc
import discounts_pb2
import discounts_pb2_grpc

_ONE_DAY_IN_SECONDS = 60 * 60 * 24

conn = psycopg2.connect(host='db', database='hash_teste',
                        user='postgres', password='example')
    
class Discount(discounts_pb2_grpc.DiscountsServicer):
    
    def Discount(self, request, context):

        # get product price 
        cur = conn.cursor()
        cur.execute("SELECT price_in_cents FROM product where id = %s",
                    (request.idprod,))
        row = cur.fetchone()
        if row is None:
            return discounts_pb2.DiscountReply(pct=0.0, value_in_cents=0)
        price = row[0]

        #get today
        today = date.today()

        birth = None
        #get user birthday
        if request.iduser != "":
            cur = conn.cursor()
            cur.execute("SELECT date_of_birth FROM \"user\" where id = %s",
                        (request.iduser,))
            row = cur.fetchone()
            if row is not None:
                birth = row[0]

        Pct, Value = logic.calcDiscount(price,today,birth)
        return discounts_pb2.DiscountReply(pct=Pct, value_in_cents=Value)


def serve():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    discounts_pb2_grpc.add_DiscountsServicer_to_server(Discount(), server)
    server.add_insecure_port('[::]:50051')
    server.start()
    try:
        while True:
            time.sleep(_ONE_DAY_IN_SECONDS)
    except KeyboardInterrupt:
        server.stop(0)


if __name__ == '__main__':
    logging.basicConfig()
    serve()
