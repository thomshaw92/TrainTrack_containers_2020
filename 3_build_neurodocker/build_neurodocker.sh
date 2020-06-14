#!/bin/bash
module load singularity/3.5.0 
#first install neurodocker
pip install --user neurodocker
pip install git+https://github.com/stebo85/neurodocker@add-itksnap
#!/usr/bin/env bash
export toolName='itksnap'
export toolVersion='3.8.0'
buildDate=`date +%Y%m%d`
imageName='itksnap'

neurodocker generate singularity \
--base ubuntu:16.04 \
--pkg-manager apt \
--${toolName} version=${toolVersion} \
--env DEPLOY_PATH=/opt/${toolName}-${toolVersion}/bin/ \
--entrypoint /opt/${toolName}-${toolVersion}/bin/itksnap \
--user=neuro \
> Singularity.itksnap


 sudo singularity build ${imageName}_${buildDate}.sif ./Singularity 

 #If you don't have root access...
 #https://github.com/singularityhub/singularityhub.github.io/wiki
 #https://cloud.sylabs.io/builder
 #build online
 singularity remote login
 #generate an API token
 singularity build --remote ${imageName}_${buildDate}.sif ./Singularity.itksnap
 #run
 singularity exec itksnap_20200614.sif itksnap