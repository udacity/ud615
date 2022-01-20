#
# Commads to execute the container image
#

#Run the image ( A contianer is created from the image and -d allows you to add the version to be executed."
echo "**** Run the image "
docker run -d monolith:1.0.0 

# Show all contianer ids no matter what state ( no matter what the state ( eg. running or stopped or others ) 
echo "**** Show all ids of any contianer"
docker ps -aq

# Get the container image id to use with the inspect
cid=`docker ps | grep monolith | tr -s ' ' | cut -f1 -d' '`

# Show a lot of information about the image 
echo "**** Showing a lot of information about the image"
docker inspect $cid

# Stop the Container 
echo "*** Stop the container"
docker stop $cid
