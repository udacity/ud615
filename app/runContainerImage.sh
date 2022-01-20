#
# Run the container image 
#

CID=$(docker run -d monolith:1.0.0)
echo "The Container id is ${CID}"

# find Network address of the Container
CIP=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' ${CID})
echo "The Network Addressof the Container is ${CIP}"

# Run the program
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo "Show the program executed -- " `curl $CIP`
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

# Stop the dockers 
echo "** For docker stop command always put the containder on STDOUT or STDERR"
docker stop $CID



