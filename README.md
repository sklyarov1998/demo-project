The app.py runs a flask servers listening to port 9000. When accessed on thr default rout it returns "healthy" ("a healt probe"). Rhe server  excepts other rout names as well and returns their reversed verisions as an output. 


Run following commands to clone the repo :

mkdir ~/demo-project
cd ~/demo-project
git init
giot clone git@github.com:sklyarov1998/demo-project.git

Run the following commands to run the code in a docker comtainer (docker has to be instulled as a prerequisite):

docker build -t myapp
docker run --name mycontainer -p 9000:9000 myapp