Insure installation of Helm and run the following commands:

<h3>Add the Argo Helm repository:</h3>

helm repo add argo https://argoproj.github.io/argo-helm

<h3>Update the Helm repositories:</h3>

helm repo update

<h3>Create the argocd namespace:</h3>

kubectl create namespace argocd

<h3>Install Argo CD using Helm:</h3>

helm install argo-cd argo/argo-cd \ <br>
  --namespace argocd \<br>
  --set server.autoSyncEnabled=true \<br>
  --set server.repository.url=https://github.com/sklyarov1998/demo-project

<h3>Port forward the Argo CD server to access the GUI:</h3>

kubectl port-forward service/argo-cd-argocd-server -n argocd 8080:443 &

<h3>Access the Argo CD GUI by opening http://localhost:8080 in your web browser.</h3>

<h3>Retrieve the initial admin password:</h3>

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

<h3>With these steps, you should be able to access the Argo CD GUI and retrieve the initial admin password needed to log in.</h3>
