#! /usr/bin/python

import os
import subprocess

MAX_IMG_PX=200

cliphist_output=None
cliphist = subprocess.run(["cliphist", "list"], capture_output=True)
output = cliphist.stdout.splitlines()

entries_bytes= bytearray()
for o in output:
    decode = subprocess.run(["cliphist", "decode"], input=o, stdout=subprocess.PIPE)

    identify = subprocess.run(["identify", "-"], input=decode.stdout, capture_output=True)
    result = identify.stdout.decode()
    if (result):
        type = result.split(" ")[1]
        convert = subprocess.run(["convert", "-", "-resize", f"{MAX_IMG_PX}x{MAX_IMG_PX}>", f"{type}:-"], input=decode.stdout, capture_output=True)
        base64 = subprocess.run(["base64", "-w", "0"], input=convert.stdout, capture_output=True)

        entries_bytes.extend(bytes("img-base64:", "utf8"))
        entries_bytes.extend(base64.stdout)
        
        # For some reason, to not have wofi fail to render the image, we must add some random bytes to the end of the base64 string.
        for i in range(40000):
            entries_bytes.extend(b"y")

        entries_bytes.extend(bytes("\n", "utf8"))
        continue

wofi = subprocess.run(["wofi", "--dmenu", "-I"], input=entries_bytes, stdout=subprocess.PIPE)
base64in = wofi.stdout.decode().strip("\n")[len("img-base64:"):]
base64d = subprocess.run(["base64", "-d"], input=bytes(base64in, "utf8"), capture_output=True)
subprocess.run(["display"], input=base64d.stdout)
