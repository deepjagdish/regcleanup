REGISTRY=/var/lib/registry 
REPO=${REGISTRY}/docker/registry/v2/repositories 
# Loop over all namespaces/repositories 
for repo in $REPO/<namespace>; do 
  # Loop over images in a namespace 
  for image in $repo/*; do 
        list=$(ls -t1  $image/_manifests/tags |tail -n +5) #list all tags in specific image except the last five
        for items in $list; do 
        	tagpathtodelete=$image/_manifests/tags/$items;  #maintain dir path of tag
        	digest=$(ls –t1 z$tagpathtodelete/index/sha256); # get the digest of image
        	for value in $digest; do    # for all the digest, this will execute many time only for 'latest' tag.
            	$image/_manifests/revisions/sha256/$value; 
            	rm -rf $image/_manifests/revisions/sha256/$value; 
        	done 
        	rm -rf $tagpathtodelete; 
  		done 
	done 
done 