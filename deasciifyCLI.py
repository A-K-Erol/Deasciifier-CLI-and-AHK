import deasciifier
import sys

if len(sys.argv) != 2:
    print("Usage: python deasciifyCli.py {text to be deasciified}")
    exit()

text = sys.argv[1]
app = deasciifier.Deasciifier()
output = app.deasciify(text)
print(output)
