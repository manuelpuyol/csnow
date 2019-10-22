#!/bin/bash

ROOT="$(git rev-parse --show-toplevel)"
HLTV_PATH=$ROOT/hltv
GIT_HOOKS_PATH=$ROOT/.git/hooks
TIMESTAMP="$(date +%s%N)"
FILENAME=$TIMESTAMP\_data.json
FILE_PATH=$HLTV_PATH/data/$FILENAME

echo "Starting node"
cd $HLTV_PATH
node app.js &
NODE_PID=$!

echo "Waiting for initialization"
sleep 3

echo "Getting data"
curl http://localhost:4000/info | jq '.' > $FILE_PATH

sleep 1

echo "Killing node"
kill -9 $NODE_PID

echo "Starting rake task"
rails upload_hltv_data[$FILE_PATH]

echo "Done"
