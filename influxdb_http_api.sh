#!/bin/bash

# get JSON data via Influx DB HTTP API using curl
# note the port number in $HOST variable
# https://docs.influxdata.com/influxdb/v1.5/guides/querying_data/

# variables

HOST="http://example.com:8086/query"
DB_USERNAME="username"
DB_PASSWORD="password"
DB_MEASUREMENT="measurement"
STARTTIME='2017-12-04T00:00:00Z'
ENDTIME='2017-12-11T23:59:59Z'
QUERY="select * from $DB_MEASUREMENT and time >= '$STARTTIME' and time <= '$ENDTIME'"
DB="db_name"
FILE_OUTPUT="filename.json"


# run query via cURL to import data from Influx DB in a chunk size of 2000000

curl -G HOST --data-urlencode "db=$DB" --data-urlencode "u=$DB_USERNAME" --data-urlencode "p=$DB_PASSWORD" --data-urlencode "chunked=true" --data-urlencode "chunk_size=20000000" --data-urlencode "q=$QUERY" -o $FILE_OUTPUT