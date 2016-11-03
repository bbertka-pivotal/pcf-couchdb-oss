cd docker-couchdb
docker build -t bbertka/couchdb:latest .
cd ..
mkdir docker-cache
docker save bbertka/couchdb | gzip -c > docker-cache/bbertka-couchdb.tgz
cd service-broker
zip -r app.zip .
mv app.zip ../resources
cd ..
tile build --docker-cache ./docker-cache
pcf import product/*.pivotal
