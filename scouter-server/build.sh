#!/usr/bin/bash
source .env

echo ">>> build server version $SCOUTER_VERSION"
export $SCOUTER_VERSION
#docker build -t scouterapm/scouter-server:$SCOUTER_VERSION .
docker push scouterapm/scouter-server:$SCOUTER_VERSION