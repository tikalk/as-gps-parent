set -e

( cd ft-analytics && pwd && mvn clean install )

for i in ft-geocoder-facade  ft-gps-service  ft-notifications   ft-device-manager  ft-gps-firehose     ft-management   ft-segments-service ; do
   ( cd $i && pwd && ./gradlew buildImage )
done

( cd ft-gps-tracker-ui  && pwd && docker build . -t shelleg/ft-gps-tracker-ui:latest --build-arg http_proxy=$http_proxy --build-arg https_proxy=$https_proxy )

wait
