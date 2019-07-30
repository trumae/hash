import unittest
import logic
from datetime import date

class TestStringMethods(unittest.TestCase):

    def test_calc(self):
        #se aniversario
        pct, value = logic.calcDiscount(10000, date(2019, 12, 5), date(2000, 12, 5))
        self.assertEqual(pct, 5.0)
        self.assertEqual(value, 500)

        #se blackfriday
        pct, value = logic.calcDiscount(10000, date(2019, 11, 25), date(2000, 12, 5))
        self.assertEqual(pct, 10.0)
        self.assertEqual(value, 1000)

        #se blackfriday e aniversario
        pct, value = logic.calcDiscount(10000, date(2019, 11, 25), date(2000, 11, 25))
        self.assertEqual(pct, 10.0)
        self.assertEqual(value, 1000)

        #se nao blackfriday e nao aniversario
        pct, value = logic.calcDiscount(10000, date(2019, 11, 5), date(2000, 12, 5))
        self.assertEqual(pct, 0.0)
        self.assertEqual(value, 0)

        #se blackfriday e sem usuario
        pct, value = logic.calcDiscount(10000, date(2019, 11, 25), None)
        self.assertEqual(pct, 10.0)
        self.assertEqual(value, 1000)

        #se nao blackfriday e sem usuario
        pct, value = logic.calcDiscount(10000, date(2019, 10, 25), None)
        self.assertEqual(pct, 0.0)
        self.assertEqual(value, 0)

if __name__ == '__main__':
    unittest.main()

