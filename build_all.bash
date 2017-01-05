( cd as-analytics && pwd && mvn clean install & )

for i in as-geocoder-facade  as-gps-service  as-notifications   as-device-manager  as-gps-firehose     as-management   as-segments-service ; do
   ( cd $i && pwd && ./gradlew buildImage & ) 
done

( cd gps-tracker-ui  && pwd && docker build . -t localhost:5000/tikal/gps-tracker-ui:latest --build-arg http_proxy=$http_proxy --build-arg https_proxy=$https_proxy & )
