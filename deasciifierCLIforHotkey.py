import deasciifier
import sys
if len(sys.argv) != 2:
    print("Usage: python deasciifyCli.py {text to be deasciified}")
    exit()

text = sys.argv[1]
text = text.replace("NEWLINE_DESIGNATOR_01000101", "\n")

app = deasciifier.Deasciifier()
output = app.deasciify(text)
print(output)
output = output.replace("\n", "NEWLINE_DESIGNATOR_01000101")

with open("temp.txt", 'w+', encoding="utf-16") as outfile:
    outfile.write(output)
