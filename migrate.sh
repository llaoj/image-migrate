#!/bin/bash

set -x

cat images.txt | awk '{ 
  dst = $1;
  gsub(/^[^\/]+\//, "", dst);
  gsub("/", "_", dst);
  print "skopeo copy docker://"$1" docker://registry.cn-beijing.aliyuncs.com/llaoj/"dst;
}' | xargs -I {} sh -c "{}"