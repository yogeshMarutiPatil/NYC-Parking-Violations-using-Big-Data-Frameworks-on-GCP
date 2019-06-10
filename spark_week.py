import sys
from decimal import Decimal
from pyspark import SparkConf, SparkContext
from csv import reader
conf = SparkConf().setAppName("week_output")
sc = SparkContext(conf=conf)
line1 = sc.textFile(sys.argv[1], 1)
line1 = line1.mapPartitions(lambda x: reader(x))
violationweekday = line1.map(lambda x: (x[5],(0 if int(x[4][-2:]) in (6,7,13,14,20,21,27,28) else 1))).reduceByKey(lambda x, y: x + y).map(lambda x: (x[0], Decimal(Decimal(x[1])/23).quantize(Decimal('.01'))))
violationweekend = line1.map(lambda x: (x[5],(1 if int(x[4][-2:]) in (6,7,13,14,20,21,27,28) else 0))).reduceByKey(lambda x, y: x + y).map(lambda x: (x[0], Decimal(Decimal(x[1])/8).quantize(Decimal('.01'))))
violationweekend.fullOuterJoin(violationweekday).map(lambda x: (x[0],x[1][0],x[1][1])).map(lambda (k, v, l): "{0}\t{1}, {2}".format(k, v, l)).saveAsTextFile("week_output.out")