#!/bin/sh

: ${MONGO_HOST:=mongo}
: ${MONGO_PORT:=27017}

until nc -z $MONGO_HOST $MONGO_PORT
do
    echo "Waiting for Mongo ($MONGO_HOST:$MONGO_PORT) to start..."
    sleep 0.5
done

ls -1 /json/*.json | sed 's/.json$//' | sed 's/^\/json\///' | while read col; do
    mongoimport --host $MONGO_HOST --db forum --collection $col --type json --file /json/$col.json --jsonArray;
done
