#
# Build the Monolith Pod
#

# Create the Monolith pod using the udacity/example-monolith:1.0.0 
kubectl create -f pods/monolith.yaml

# Relate a private ip address ( of the pod ) with a public address
kubectl port-forward monolith 10000:80



# Get Basic information about the pods
echo "************************** Basic Information"
kubectl get pods

# Get more information about the pods
echo "************************** Detailed Information"
kubectl describe pods monolith
