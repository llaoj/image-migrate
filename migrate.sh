#!/bin/bash

set -x

ACR_REPO=registry.cn-beijing.aliyuncs.com
ACR_IMAGE_REPO=${ACR_REPO}/llaoj

cat images.txt | while read line
do
  echo "Copying $line ..."
  image=${line#*/}
  image=${ACR_IMAGE_REPO}/${image/\//_}
  skopeo copy docker://"${line}" docker://"${image}"
done