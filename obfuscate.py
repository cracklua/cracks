import os
import subprocess

for filename in os.listdir("."):
    if os.path.isfile(filename):
        with open(filename, 'r') as file:
            if file.readline().strip() == "-- obfuscate":
                command = fr'lua "C:\Users\ebeli\Desktop\roblox executors\Solara\Prometheus\cli.lua" --preset ol ./{filename} --o ./{filename}'
                subprocess.run(command, shell=True)