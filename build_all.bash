set -e

( cd ft-analytics && pwd && mvn clean install )

for i in ft-geocoder-facade  ft-gps-service  ft-notifications   ft-device-manager  ft-gps-firehose     ft-management   ft-segments-service ft-gps-tracker-ui ; do
   ( cd $i && pwd && ./gradlew buildImage --info )
done

wait
