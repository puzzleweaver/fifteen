from pathlib import Path

def listFilenames(dir, filename):
    ret = []
    paths = Path(dir).glob(filename)
    for path in paths:
        filename = str(path)
        ret.append(filename)
    return ret

def printDart(files, varname):
    print('static final', varname, '= [')
    for file in files:
        print('\t"' + file + '",')
    print('];')

import re
boardFiles = listFilenames('assets/boards', '*.json')
boardFiles = sorted(boardFiles, key=lambda x: int(re.match(r"^\d+", x.split('/')[-1]).group()) if re.match(r"^\d+", x.split('/')[-1]) else 0)
printDart(boardFiles, 'boards')

photoFiles = listFilenames('assets/images/photos', '*.jpg')
photoFiles.sort()
printDart(photoFiles, 'images')
