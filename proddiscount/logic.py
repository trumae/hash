import time
from datetime import date

def calcDiscount(price, today, birth):
    pct = 0.0
    
    if birth is not None:
        if today.month == birth.month and today.day == birth.day:
            pct = 5.0

    if today.month == 11 and today.day == 25:
        pct += 10.0

    if pct > 10.0:
        pct = 10.0

    return pct, int(price * pct/100.00)

