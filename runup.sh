#!/usr/bin/env bash
set -eou pipefail

# --- Load configs ---
source $(pwd)/var-config.sh .

# --- Create directories where Ghost's data lives
mkdir -pv ${LOCAL_PATH}

# --- Remove Container (in case the container is already running)
source $(pwd)/rundown.sh .

source ./fct_sync_external_themes.sh .

# --- Sync my local theme(s)
DIR_FROM=${DIR_MY_THEMES}
DIR_INTO=${DIR_CONTENT_THEMES}
source ./fct_rsync_nodelete.sh .

# --- Start Container
echo && echo  "--- UNIT TEST for: <${GHOST_IMG}> - START ---" && \
docker pull ${GHOST_IMG} && echo && \

docker run -d \
--name ${CTN_NAME} \
-p 2368:2368 \
-e WEB_URL=http://localhost:2368 \
-v "${LOCAL_PATH}":"${CONTAINER_PATH}" \
"${GHOST_IMG}" && \

# uncomment if needed
#docker inspect ${CTN_NAME} && echo && echo && \
#docker logs ${CTN_NAME} && echo && echo && \

echo && echo  "--- Checkpoint 01 | uname -a ---" && \
docker exec -it ${CTN_NAME} \
uname -a; sleep 0.5 && \

echo && echo  "--- Checkpoint 02 | Ghost version ---" && \
docker exec -it ${CTN_NAME} \
cat /var/lib/ghost/current/package.json | grep '"version":' | sed 's: ::g' && \

echo && echo  "--- Checkpoint 03 | Theme version (aka casper) ---" && \
docker exec -it ${CTN_NAME} \
cat /var/lib/ghost/current/content/themes/casper/package.json | grep '"version":' | sed 's: ::g' && \

echo && echo  "--- Checkpoint 04 | node --version ---" && \
docker exec -it ${CTN_NAME} \
node --version && \
echo && \

# This will wait for Ghost to be running
export FLAG_WAIT="true"
while [[ ${FLAG_WAIT} == "true" ]]; do

  # check if apps are running on K8s (or are in progress)

  IN_PROGRESS=$(curl -Is --head "http://localhost:2368/ghost" | grep "HTTP/1.1 301 Moved Permanently" | wc -l)

  if [[ ${IN_PROGRESS} -eq 0 ]]; then
    echo "--- Ghost is starting ..." && \
    sleep 2.5 ;
  elif [[ ${IN_PROGRESS} -ne 0 ]]; then
    echo "--- Ghost is ready! ---> " && \
    echo && docker ps && \
    echo && \
    echo "--- Go to: http://localhost:2368 ---" && \
    echo "--- Ghost's container will be removed in ${WAIT_TIMER} seconds ---" && \
    FLAG_WAIT="false";
  else
    echo "Unexpected error (err45)" ;
  fi
done && \

# Wait then shut down Ghost
sleep ${WAIT_TIMER} && \
source ${ROOT_PROJECT}/rundown.sh .
