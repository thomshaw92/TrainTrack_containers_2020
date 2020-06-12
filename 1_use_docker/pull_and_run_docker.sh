
#First let's try the simplest example:
docker pull hello-world

#and then try:
docker run hello-world
#You can also just pull and run from the command line by using docker run. 

#where are the Docker images located?
docker images 
#find image id
#figure something out here
#image_id=`docker images | grep hello-world | awk '{print $3}`
#caching
docker pull hello-world

#remove the image
docker rmi ${image_id}
#or if that doesn't work
docker rmi -f ${image_id}

#Ok, so let's try a real example.
#First let us check out our example dataset
#https://openneuro.org/datasets/ds000205/versions/00001
#https://aws.amazon.com/cli/
#aws s3 sync --no-sign-request s3://openneuro.org/ds000205 ds000205-download/

#Then we pull fmriprep (this will take a while!)
docker pull poldracklab/fmriprep:latest
#NB you can use the docker fmriprep wrapper but we will be interfacing directly with the Docker image.
#check in https://fmriprep.readthedocs.io/en/stable/docker.html 
#https://hub.docker.com/r/poldracklab/fmriprep/tags
##FIXME I can't get this to work on windows
docker run -ti --rm -v $HOME/data/BrainHackOHBM2020:/data:ro `
-v $HOME/data/derivatives:/out -v $HOME/data/work:/work `
poldracklab/fmriprep:latest /data /out/fmriprep-latest participant -w /work

#If you are on Linux: check fmriprep website!