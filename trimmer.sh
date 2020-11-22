#!/bin/bash -e

# Usage: sudo $0 /path/to/trim_file /path/to/trim_dev
# Example: sudo ./trimmer.sh /media/ubuntu/EXT_SSD/Users/user/trim_test_big_file /dev/sdb

hdparm --fibmap "$1" 2>&1 | tail -n +5 | while read line ; do 
  read byteOffset beginLBA endLBA sectors < <(echo "$line")
  echo "$line"
  echo $byteOffset $beginLBA $endLBA $sectors
  bash ./hdtrimlist.sh $sectors $beginLBA | hdparm --trim-sector-ranges-stdin --please-destroy-my-drive "$2"
done

