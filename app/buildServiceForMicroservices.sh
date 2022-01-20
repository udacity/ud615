#
# Build the applications for the miscroservices
#

# create a stribg with the services to be compiled
services="auth hello"

# compile each service
for service  in $services 
do
  ( cd $service ; go build --tags netgo --ldflags '-extldflags "-lm -lstdc++ -static"' ; docker build -t $service:1.0.0 . ) 
  echo "**************************************************************"
done
