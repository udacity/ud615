# Use the Pod

echo "Show the Default Service"
curl http://localhost:10080
echo "************************"

echo "Show the Authentication Service"
curl http://localhost:10080/secure
echo "************************"

echo "Get the login token for the person with the username user"
token=`curl -u user:password http://localhost:10080/login | jq .token | tr -d \"`
echo $token
echo "*************************************************"

echo "Login with the token"
curl -H "Authorization: Bearer $token" http://localhost:10080/secure
echo "*************************************************"

#
# Can use the -f option kubectl logs -f monolith to see the logs in real time
echo "Show Logs"
kubectl logs monolith
echo "************************":
