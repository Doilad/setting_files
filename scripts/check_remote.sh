cd {directory}r
git checkout master
 git fetch
HEADHASH=$(git rev-parse HEAD)
UPSTREAMHASH=$(git rev-parse master@{upstream})

now=$(date)
if [ "$HEADHASH" != "$UPSTREAMHASH" ]
then
  echo -e ${ERROR}Not up to date with origin. Aborting.${NOCOLOR}
  echo
  curl -X POST -H 'Content-type: application/json' --data "{\"text\": \"$(date): New updates on remote repository\"}" [git_hook]
  exit 0
else
  echo -e ${FINISHED}Current branch is up to date with origin/master.${NOCOLOR}
  curl -X POST -H 'Content-type: application/json' --data "{\"text\": \"$(date): No updates on remote repository\"}" [git_hook]

cd
