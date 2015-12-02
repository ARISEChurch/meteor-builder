#!/usr/bin/env sh

cd /app
meteor build --directory /tmp/the-app

ls /tmp/the-app/bundle
ls /tmp/the-app/bundle/programs
cd /tmp/the-app/bundle/programs/server/
npm i

mv /tmp/the-app/bundle /app

# cleanup
rm -rf /tmp/the-app
rm -rf ~/.meteor
rm /usr/local/bin/meteor
