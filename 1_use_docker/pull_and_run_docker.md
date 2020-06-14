
# Docker pull and run
First let's try the simplest example and pull the hello-world of docker:
```
docker pull hello-world
```

and then try running it:
```
docker run hello-world
```

(just docker run on its own would pull the image as well if it's not there yet)

# Images
where are the Docker images located?
```
docker images 
```
in windows all docker images are stored in a single hyper-v virtual machine disk at: C:\ProgramData\DockerDesktop\vm-data\DockerDesktop.vhdx

# Caching
find image id of hello world

remove the image
```
docker rmi ${image_id}
```
or if that doesn't work
```
docker rmi -f ${image_id}
```

# fMRI prep example
First let us check out our example dataset
```
https://openneuro.org/datasets/ds000205/versions/00001
https://aws.amazon.com/cli/ 
aws s3 sync --no-sign-request s3://openneuro.org/ds000205 ds000205-download/
```
Then we pull fmriprep (this will take a while!)
```
docker pull poldracklab/fmriprep:latest
```

NB you can use the docker fmriprep wrapper but we will be interfacing directly with the Docker image.
check in https://fmriprep.readthedocs.io/en/stable/docker.html 
https://hub.docker.com/r/poldracklab/fmriprep/tags for the latest versions of fmriprep

Running fMRI prep container in Windows:
```
docker run -ti --rm `
-v $HOME/data/BrainHackOHBM2020:/data:ro `
-v $HOME/data/derivatives:/out `
-v $HOME/data/work:/work `
poldracklab/fmriprep:latest /data /out/fmriprep-latest `
participant -w /work
```

#If you are on Linux: check fmriprep website https://fmriprep.readthedocs.io/en/stable/docker.html !