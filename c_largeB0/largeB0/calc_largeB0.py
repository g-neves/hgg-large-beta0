import subprocess

for i in range(24):
  subprocess.run(["../startform3", "-S", "form.set", "-d", "CLASS=c_largeB0", "-d", "PROBLEM=largeB0", "-d", "LOOPS=2", "-d", "DIAFILE=d2l.dia", "-d", "RESDIR=results", "-d", "DIAGRAM=d2l" + str(i),  "generic/maindia.frm"])
