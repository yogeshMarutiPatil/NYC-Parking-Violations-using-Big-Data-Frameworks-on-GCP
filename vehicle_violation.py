import sys
from pyspark import SparkConf, SparkContext
from csv import reader
conf = SparkConf().setAppName("vehicle_violation")
sc = SparkContext(conf=conf)
line1 = sc.textFile(sys.argv[1], 1)
line1 = line1.mapPartitions(lambda x: reader(x))
id = line1.map(lambda x: ((x[1],x[2]),1)).reduceByKey(lambda x, y: x + y).sortBy(lambda x: x[1], False)
top20violator = sc.parallelize(id.take(20)).map(lambda x: (x[0][0], x[0][1], x[1]))
top20violator.map(lambda (k, v, l): "{0}, {1}\t{2}".format(k, v, l)).saveAsTextFile("vehicle_violation.out")