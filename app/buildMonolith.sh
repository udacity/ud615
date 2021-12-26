#
# Commands to build the monlith
#

# Create the directory if it does not exit
crateDirectoryIfItDoesNotExist() {
   if [ ! -d $1 ] 
   then 
      mkdir $1
   fi
}

# Create the 
createGoModuleIfItDeosNotExist() {
   if [ ! -e go.mod ]
   then 
      go mod init
   fi
}

executableDir="bin"
crateDirectoryIfItDoesNotExist $executableDir
createGoModuleIfItDeosNotExist
go build -o ./bin/monolith ./monolith


