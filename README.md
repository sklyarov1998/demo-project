The app.py runs a flask servers listening to port 9000. When accessed on thr default rout it returns "healthy" ("a healt probe"). The server  excepts other rout names as well and returns their reversed verisions as an output. 

The repo runs a workflow triggered by a commit to the main branch. For the workflow to complete successfully set a Docker Hub account and create a PAT. Set DOCKERHUB_TOKEN and DOCKERHUB_USERNAME secrets in your GitHub repo. For more detailed instructions access https://docs.docker.com/build/ci/github-actions/ .

U can run a deployment set using the built image from the Docker Hub. You are required to have Docker and Kubernetes installed. 

Run the following command to deploy the set:

kubectl create -f app-deployment.yaml


Run following commands to clone the repo :

mkdir ~/demo-project<br>
cd ~/demo-project<br>
git init<br>
giot clone git@github.com:sklyarov1998/demo-project.git<br>

Run the following commands to run the code in a docker comtainer (docker has to be instulled as a prerequisite):

docker build -t myapp<br>
docker run --name mycontainer -p 9000:9000 myapp
