Insure installation of Helm and run the following commands:

<h4>>Add the Argo Helm repository:</h4>

helm repo add argo https://argoproj.github.io/argo-helm

<h4>Update the Helm repositories:</h4>

helm repo update

<h4>Create the argocd namespace:</h4>

kubectl create namespace argocd

<h4>Install Argo CD using Helm:</h4>

helm install argo-cd argo/argo-cd \ <br>
  --namespace argocd \<br>
  --set server.autoSyncEnabled=true \<br>
  --set server.repository.url=https://github.com/sklyarov1998/demo-project

<h4>Port forward the Argo CD server to access the GUI:</h4>

kubectl port-forward service/argo-cd-argocd-server -n argocd 8080:443 &

<h4>Access the Argo CD GUI by opening http://localhost:8080 in your web browser.</h4>

<h4>Retrieve the initial admin password:</h4>

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

With these steps, you should be able to access the Argo CD GUI and retrieve the initial admin password needed to log in.
