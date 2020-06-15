#!/bin/bash

#First we need to set up singularity.
#Most HPCs will use lmod to manage software

module load singularity/3.5.0

#Then pull the same image from DockerHub. Singularity will handle the conversion from docker for you and you don't need root access to do this :)
mkdir ${HOME}/images
singularity build ${HOME}/images/fmriprep-latest.simg docker://poldracklab/fmriprep:latest

singularity run --cleanenv ${HOME}/images/fmriprep.simg \
    path/to/data/dir path/to/output/dir \
    participant \
    --participant-label label