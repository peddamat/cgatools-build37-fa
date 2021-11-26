# CGAtools Docker Container

## Summary

This Dockerfile automatically generates a `build37.crr` reference file to support analyzing Complete Genomics Incorporated (CGI) sequencing data.

The generated `build37.crr` matches the CGI reference `build37.crr` file:

```sh
> cgatools listcrr --reference ref/build37.crr
ChromosomeId Chromosome    Length Circular Md5
           0       chr1 249250621    false 1b22b98cdeb4a9304cb5d48026a85128
           1       chr2 243199373    false a0d9851da00400dec1098a9255ac712e
           2       chr3 198022430    false 641e4338fa8d52a5b781bd2a2c08d3c3
           3       chr4 191154276    false 23dccd106897542ad87d2765d28a19a1
           4       chr5 180915260    false 0740173db9ffd264d728f32784845cd7
           5       chr6 171115067    false 1d3a93a248d92a729ee764823acbbc6b
           6       chr7 159138663    false 618366e953d6aaad97dbe4777c29375e
           7       chr8 146364022    false 96f514a9929e410c6651697bded59aec
           8       chr9 141213431    false 3e273117f15e0a400f01055d9f393768
           9      chr10 135534747    false 988c28e000e84c26d552359af1ea2e1d
          10      chr11 135006516    false 98c59049a2df285c76ffb1c6db8f8b96
          11      chr12 133851895    false 51851ac0e1a115847ad36449b0015864
          12      chr13 115169878    false 283f8d7892baa81b510a015719ca7b0b
          13      chr14 107349540    false 98f3cae32b2a2e9524bc19813927542e
          14      chr15 102531392    false e5645a794a8238215b2cd77acb95a078
          15      chr16  90354753    false fc9b1a7b42b97a864f56b348b06095e6
          16      chr17  81195210    false 351f64d4f4f9ddd45b35336ad97aa6de
          17      chr18  78077248    false b15d4b2d29dde9d3e4f93d1d0f2cbc9c
          18      chr19  59128983    false 1aacd71f30db8e561810913e0b72636d
          19      chr20  63025520    false 0dec9660ec1efaaf33281c0d5ea2560f
          20      chr21  48129895    false 2979a6085bfe28e3ad6f552f361ed74d
          21      chr22  51304566    false a718acaa6135fdca8357d5bfe94211dd
          22       chrX 155270560    false 7e0e2e580297b7764e31dbc80c2540dd
          23       chrY  59373566    false 1e86411d73e6f00a10590f976be01623
          24       chrM     16569     true c68f52674c9fb33aef52dcf399755519
```

![CGA Tools User Guide (page 18)](/docs/screenshot-cgatools-listcrr.png?raw=true)
- [CGA Tools User Guide 1.8](http://cgatools.sourceforge.net/docs/1.8.0/cgatools-user-guide.pdf)

## Usage

### Build
The build process automatically creates `ref/build37.crr` and `ref/build37.crr.md5` file.
```
./build.sh
```

### Run
```
./run.sh

# Confirm the generated build37.crr file matches the CGI reference file
cgatools listcrr --reference ref/build37.crr

# Copy the generated build37.crr out of the container
cp ref/build37.crr output/
```

## Background

This code supports a project which is analyzing DNA sequences created by CGI for the [TARGET AML Program](https://ocg.cancer.gov/programs/target/projects/acute-myeloid-leukemia).

As the sequences were produced in the early 2010's, CGI did not provide a complete set of .vcf files.

Creating .vcf files from the provided input requires using the `cgatools mkvcf` command.

At the time of development, the CGI reference sequences hosted on ftp.completegenomics.com were unaccessible, therefore, the required inputs for `cgatools mkvcf` needed to be created using the process described in the [CGAtools 1.8 User Guide](http://cgatools.sourceforge.net/docs/1.8.0/cgatools-user-guide.pdf) (pages 16-18).
