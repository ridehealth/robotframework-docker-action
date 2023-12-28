# Create reports folder
REPORTS_DIR=$(pwd)/$ROBOT_REPORTS_DIR
TESTS_DIR=$(pwd)/$ROBOT_TESTS_DIR
RESOURCES_DIR=$(pwd)/$ROBOT_RESOURCES_DIR
sudo mkdir $REPORTS_DIR && sudo chmod 777 $REPORTS_DIR

docker run --shm-size=$ALLOWED_SHARED_MEMORY \
  -e ADMIN_HOST="$ADMIN_HOST" \
  -e ADMIN_EMAIL="$ADMIN_EMAIL" \
  -e ADMIN_PASSWORD="$ADMIN_PASSWORD" \
  -e PLATFORM_HOST="$PLATFORM_HOST" \
  -e PLATFORM_EMAIL="$PLATFORM_EMAIL" \
  -e PLATFORM_PASSWORD="$PLATFORM_PASSWORD" \
  -e BROWSER=$BROWSER \
  -e ROBOT_THREADS=$ROBOT_THREADS \
  -e PABOT_OPTIONS="$PABOT_OPTIONS" \
  -e ROBOT_OPTIONS="$ROBOT_OPTIONS" \
  -v $REPORTS_DIR:/opt/robotframework/reports:Z \
  -v $RESOURCES_DIR:/opt/robotframework/resources:Z \
  -v $TESTS_DIR:/opt/robotframework/tests:Z \
  --user $(id -u):$(id -g) \
  $ROBOT_RUNNER_IMAGE
