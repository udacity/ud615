#
# Show the services that monolith and then the microservice will provide
#

echo "Service : Display a message"
curl http://localhost:10000
echo "--"

echo "Service : Acquire a JWT Token"
TOKEN=$(curl http://127.0.0.1:10000/login -u user:password | jq -r '.token')
echo $TOKEN
echo "--"

echo "Service : Login using a JWT Token and print a message"
curl -H "Authorization: Bearer $TOKEN" http://127.0.0.1:10000/secure

