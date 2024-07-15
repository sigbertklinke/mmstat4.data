import subprocess
import sys
url = "https://commons.wikimedia.org/wiki/File:Python_brongersmai,_Brongersma%27s_short-tailed_python.jpg"
if sys.platform.startswith('win'):
  subprocess.Popen(['start', '""', url], shell=True)
elif sys.platform.startswith('darwin'):
  subprocess.Popen(['open', url])
elif sys.platform.startswith('linux'):
  subprocess.Popen(['xdg-open', url])
else:
  print("Unsupported platform")
