# go to current folder
cd "$(dirname "$0")"
cd ..

docker rm -f 5chan-previewer 2>/dev/null

# find port number in config.js
port=$(cat config.js | grep port: | sed -e s/[^0-9]//g)

if [ -z "$port" ]
then
  echo "can't find config.port in config.js"
  exit 1
fi

echo "starting docker on port '$port'"

docker run \
  --detach \
  --name 5chan-previewer \
  --restart always \
  --log-opt max-size=10m \
  --log-opt max-file=5 \
  --volume=$(pwd):/usr/src/5chan-previewer \
  --workdir="/usr/src/5chan-previewer" \
  --publish "80:$port" \
  node:20 sh -c "npm ci && npm start"

docker logs --follow 5chan-previewer
