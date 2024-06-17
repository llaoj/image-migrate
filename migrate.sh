#!/bin/bash

set -x

ACR_REPO=registry.cn-beijing.aliyuncs.com
ACR_IMAGE_REPO=${ACR_REPO}/llaoj

echo "Copy images to Aliyun Container Registry"

while IFS= read -r line
do
  myimage=${line#*/}
  myimage=${ACR_IMAGE_REPO}/${myimage/\//_}
  skopeo copy docker://"${line}" docker://"${myimage}"
done < images.txt