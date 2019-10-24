docker pull patradinesh/jenkins:lint
docker run -d -p 9000:8080 -p 50000:50000 patradinesh/jenkins:lint
docker run --rm --name jenkins_lint -d -p 8080:8080 patradinesh/jenkins:lint

for i in `ls Jenkinsfile*`
do
curl --user admin:admin -X POST -F "jenkinsfile=<$i" http://localhost:9000/pipeline-model-converter/validate
done

## clean up
#stop the container
docker stop jenkins_lint
# remove the stopped container
#docker rm jenkins_lint
#remove the image
docker rmi `docker images patradinesh/jenkins:lint -q`
