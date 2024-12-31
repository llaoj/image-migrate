#!/bin/sh

set -x

# "Download files and upload to OSS"
if [ -s ./files.txt ]; then
  wget -qx -P /tmp/files -i ./files.txt
  tree /tmp/files
  wget -q https://gosspublic.alicdn.com/ossutil/1.7.13/ossutil64 && chmod 755 ossutil64
  ./ossutil64 \
    -e oss-cn-beijing.aliyuncs.com \
    -i "$1" \
    -k "$2" \
    cp /tmp/files oss://llaoj/files/ -ruf --acl=public-read
fi
