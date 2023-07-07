The CI of the repo is implemented with GitHub actions. Each time a change to an integration directory is pushed, the workflow will be triggered to:
1)build a Docker image including the app.py and Pipfile<br>
2)update the tag in the app-deployment.yaml<br>
3)upload the immage to a Docker Hub with the updated tag <br>
4)commit the changes in the repo (the app-deployment.yaml is altered during the workflow).

The GitHub actions bot does require assignment of read-write permissions. (Go Settings - Actions - General - Workflow Permissions ) 

Further secrets should be set in your repo as well :

DOCKERHUB_USER<br>
DICKERHUB_TOKEN<br>
GIT_EMAIL<br>
GIT_NAME
