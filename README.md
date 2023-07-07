The app.py runs a flask servers listening to port 9000. When accessed on the default rout it returns "healthy" ("a healt probe"). The server  excepts other rout names as well and returns their reversed verisions as an output. 

You can set a CD pipeline runned by GitHub Actions. The workflow will build the image, update its tag, update the image tag used in app-deployment.yaml and upload the built image with the new tag to the Docker Hub.  For further instructions check [CI.md](./CI.md)

You can set a CI pipeline runned by ArgoCD. To do so insure installment of Docker,Kubernetes and Helm. For further instructions for Argo CD installment check [CD.md](./CD.md). 

Run following commands to clone the repo :

mkdir ~/demo-project<br>
cd ~/demo-project<br>
git init<br>
git clone git@github.com:sklyarov1998/demo-project.git<br>
