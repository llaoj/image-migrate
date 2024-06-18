# Image Migrate

Migrate images from outside to inside of the GREAT FIREWALL.  
Edit `images.txt`, add the images by line, then commit the changes.

All the migrated images are stored in `registry.cn-beijing.aliyuncs.com/llaoj/`.  
Migration rule:  
`registry.io/repo/image:tag` -> `registry.cn-beijing.aliyuncs.com/llaoj/repo_image:tag`
