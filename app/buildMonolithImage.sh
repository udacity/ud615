#
# Builds the image for the monolithg and show the image has built 
#

# Build the Container Image.  The image is only built, not executing
( cd monolith; docker build -t monolith:1.0.0 \. )

# show the image was created
docker images monolith:1.0.0 
