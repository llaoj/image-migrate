#!/bin/sh

set -x

if [ -s /tmp/images.txt ]; then
  cat /tmp/images.txt | awk '{ 
  if(NF==2){
    dst = $2;
  }else{
    dst = $1;
    gsub(/^[^\/]+\//, "", dst);
    gsub("/", "_", dst);
  }
  print "skopeo copy --multi-arch all docker://"$1" docker://registry.cn-beijing.aliyuncs.com/llaoj/"dst;
}' | xargs -P 5 -I {} sh -c "{}"
fi
