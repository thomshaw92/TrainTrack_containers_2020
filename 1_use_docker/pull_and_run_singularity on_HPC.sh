#!/bin/bash

#First we need to set up singularity.
#Most HPCs will use module

module load singularity

#Then pull the same image from DockerHub. Singularity will handle the conversion for you.
mkdir ${HOME}/images
singularity build ${HOME}/images/fmriprep-latest.simg docker://poldracklab/fmriprep:latest

singularity run --cleanenv fmriprep.simg \
    path/to/data/dir path/to/output/dir \
    participant \
    --participant-label label
