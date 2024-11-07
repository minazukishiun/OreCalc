import numpy as np
outputDict = {}

with open('praisal.txt') as f:
    flag = 0
    key = ''
    for line in f:
        if flag == 1:
            x = line.split()
            outputDict[key] = float(x[1].replace(',', ''))
            flag = 0
        if 'Compressed' in line:
            flag = 1
            key = line.split()[2]
print(str(np.array(sorted(outputDict.items(), key=lambda item: item[0]))[:,1]).replace('\'','').replace(' ',', '))
