"Transparent Singularity" (https://github.com/CAIsr/transparent-singularity) aims at deploying a singularity container transparently, so that an application inside the container can be used without adjusting any scripts or pipelines (e.g. nipype). 

```
git clone https://github.com/CAIsr/transparent-singularity.git itksnap_ts
cp itksnap_20200614.sif itksnap_ts/
cd itksnap_ts/
./run_transparent_singularity.sh --container itksnap_20200614.sif
```

This automatically creates wrapper scripts and instead of typing
```
singularity exec itksnap_20200614.sif itksnap
```

we can just run the wrapper script created
```
itksnap
```

download a container we already build by showing which containers exist:
```
curl -s -S -X GET https://swift.rc.nectar.org.au:8888/v1/AUTH_d6165cc7b52841659ce8644df1884d5e/singularityImages
```
and then install this container:
```
git clone https://github.com/CAIsr/transparent-singularity.git convert3d_1.0.0_20200420
cd convert3d_1.0.0_20200420
./run_transparent_singularity.sh --container convert3d_1.0.0_20200420.sif
```

