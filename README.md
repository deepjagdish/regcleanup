# Registry cleanup script

Cleanup all tags from an image but last five tags. These last five tags can be used to rollback purpose.  

To clean up these tags you need to delete two dirs from repository location.  

rm –r  <reg_mount_loc>/v2/repositories/${name}/_manifests/tags/${tag}/index/sha256/${hash} 

rm -r <reg_mount_loc>/v2/repositories/${name}/_manifests/revisions/sha256/${hash} 

But cleaning up huge number of images with huge number of tags can be tedious job. Here is code snippet which can be used to clean up all tags but last five tags from entire repository or specific namespace. 

