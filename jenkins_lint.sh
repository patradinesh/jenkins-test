#!/bin/bash
# echo " Check if Docker is running...  "
#
# isDockerRunning(){
    # {
    #     `ps -ef | grep "[d]ocker" | awk {'print $2'}`
    # }
    # isDockerRunning()


## clean up - before starting

#set -x
dockerClean()
{
    CONTAINER_ID=`docker ps -f "name=jenkins_lint" -q`
    echo $CONTAINER_ID

    if [ $CONTAINER_ID ];
    then
        echo "Docker clean ..."
        docker stop $CONTAINER_ID
    # remove the stopped container
        docker rm $CONTAINER_ID 2>/dev/null
    #remove the image
        #docker rmi `docker images patradinesh/jenkins:lint -q`
      else
        echo "Proceed to Docker run ..."
    fi
}

dockerClean

#echo "Docker run.."
docker pull patradinesh/jenkins:lint
docker run --rm --name jenkins_lint -d -p 8080:8080 patradinesh/jenkins:lint
JENKINS_URL=http://localhost:8080/pipeline-model-converter/validate
#Wait until the Jenkins is UP
sleep 20
curl ${JENKINS_URL} -u admin:admin -X POST -F "jenkinsfile=<./Jenkinsfile"

dockerClean
