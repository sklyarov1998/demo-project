The app.py runs a flask servers listening to port 9000. When accessed on the default rout it returns "healthy" ("a healt probe"). The server  excepts other rout names as well and returns their reversed verisions as an output. 

The repo runs a workflow triggered by a commit to the main branch. For the workflow to complete successfully set a Docker Hub account and create a PAT. Set DOCKERHUB_TOKEN and DOCKERHUB_USERNAME secrets in your GitHub repo. For more detailed instructions access https://docs.docker.com/build/ci/github-actions/ .

You can set a CI pipeline runned by ArgoCD. To do so, insure installation of Helm and run the following commands:

<h1>Add the Argo Helm repository:</h1>

helm repo add argo https://argoproj.github.io/argo-helm

<h2>Update the Helm repositories:</h2>

helm repo update

<h3>Create the argocd namespace:</h3>

kubectl create namespace argocd

<h4>Install Argo CD using Helm:<h4>

helm install argo-cd argo/argo-cd \ <br>
  --namespace argocd \<br>
  --set server.autoSyncEnabled=true \<br>
  --set server.repository.url=https://github.com/sklyarov1998/demo-project

<h5>Port forward the Argo CD server to access the GUI:</h5>

kubectl port-forward service/argo-cd-argocd-server -n argocd 8080:443 &

<h6>Access the Argo CD GUI by opening http://localhost:8080 in your web browser.</h6>

<h7>Retrieve the initial admin password:</h7>

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

<h8>With these steps, you should be able to access the Argo CD GUI and retrieve the initial admin password needed to log in.</h8>


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
