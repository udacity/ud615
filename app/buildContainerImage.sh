#
# Commands to build the container image 
#
# Statically link the libraries since different base image may have incompatible libraries
#

# Create the go.mod if it does not exist
createGoModuleIfItDeosNotExist() {
   if [ ! -e go.mod ]
   then 
      go mod init
   fi
}

createGoModuleIfItDeosNotExist
go get -u
( cd monolith ; go build --tags netgo --ldflags '-extldflags "-lm -lstdc++ -static"' )


