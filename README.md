# hdparm-trimmer-scripts

ssd trimming (kind of) with hdparm 

SSD trimmer enploys hdparm --trim-sector-ranges command, 
when regular SATA TRIM not available in FS driver (for example in USB enclosure).
In this situation hdparm usually still works, and allows to send TRIM commands to disk "manually".

Creating (allocating) big file without extra writes on Linux:

  sudo hdparm --fallocate 1000 temp_file

Creating (allocating) big file without extra writes on macOS:
Compile resize-mac.c

  gcc resize-mac.c -o resize-mac
  ./resize-mac /path/to/big_file 1000

Run trimmer script:

  sudo ./trimmer.sh /path/to/trim_file /path/to/trim_dev


