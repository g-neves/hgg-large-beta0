import subprocess

for i in range(24):
  subprocess.run(["../startform3", "-S", "form.set", "-d", "CLASS=c_hggnlo", "-d", "PROBLEM=hggnlo", "-d", "LOOPS=2", "-d", "DIAFILE=d2l.dia", "-d", "RESDIR=results", "-d", "DIAGRAM=d2l" + str(i),  "generic/maindia.frm"])
