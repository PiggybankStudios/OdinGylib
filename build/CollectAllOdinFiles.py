
import os
import sys
import shutil
from pathlib import Path

fromFolder = sys.argv[1].replace("\\", "/");
toFolder = sys.argv[2].replace("\\", "/");
if (fromFolder.endswith("/")): fromFolder = fromFolder[0:-1];
if (toFolder.endswith("/")): toFolder = toFolder[0:-1];

Path(toFolder).mkdir(parents=True, exist_ok=True);

print("Copying all .odin files from \"%s\" to \"%s\"" % (fromFolder, toFolder));

numFilesCopied = 0;
for root, directories, files in os.walk(fromFolder):
#
	for file in files:
	#
		if (file.endswith(".odin")):
		#
			fullFromPath = root.replace("\\", "/") + "/" + file;
			fullToPath = toFolder.replace("\\", "/") + "/" + file;
			# print("Found \"%s\"!" % (fullFromPath));
			shutil.copyfile(fullFromPath, fullToPath);
			numFilesCopied += 1;
		#
	#
#

print("Copied %u .odin files!" % (numFilesCopied));
