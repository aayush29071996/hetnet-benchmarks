
#!/bin/sh

for FILE in `ls *.png` ; do
  convert $FILE $FILE.pdf
  
done
