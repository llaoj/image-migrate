#!/bin/bash

set -x

ACR_REPO=registry.cn-beijing.aliyuncs.com
ACR_IMAGE_REPO=${ACR_REPO}/llaoj

echo "Copy images to Aliyun Container Registry"
cat ./images.txt
cat ./images.txt | while read line 
do
    image=${ACR_IMAGE_REPO}/${line/\//_}
    skopeo copy docker://"${line}" docker://"${image}"
done