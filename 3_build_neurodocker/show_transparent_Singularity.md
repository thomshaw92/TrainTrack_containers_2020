"Transparent Singularity" (https://github.com/CAIsr/transparent-singularity) aims at deploying a singularity container transparently, so that an application inside the container can be used without adjusting any scripts or pipelines (e.g. nipype). 

```
git clone https://github.com/CAIsr/transparent-singularity.git itksnap_ts
cp itksnap_20200614.sif itksnap_ts/
cd itksnap_ts/
./run_transparent_singularity.sh --container itksnap_20200614.sif
```

