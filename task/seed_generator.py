import random
import sys

seed_list = []

for i in range(1000):
    seed_value = random.randrange(sys.maxsize)
    num = random.randint(1, 1000000)
    seed_list.append(num)
    
with open('seed.dat', 'w') as f:
    for item in seed_list:
        f.write("%s " % item)
    