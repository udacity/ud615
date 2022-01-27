#
# Build the Monolith Pod
#

# Create the Monolith pod using the udacity/example-monolith:1.0.0 
# This takes a very time, but eventually it will succeed need to fix
kubectl create -f pods/monolith.yaml 

# Wait until the creation has been completed
kubectl wait --for=condition=ready --timeout=30s pod/monolith

# Relate a private ip address ( of the pod ) with a public address
kubectl port-forward monolith 10080:80 &



# Get Basic information about the pods
#echo "************************** Basic Information"
#kubectl get pods

# Get more information about the pods
#echo "************************** Detailed Information"
#kubectl describe pods monolith
