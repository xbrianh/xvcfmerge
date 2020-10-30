# xvcfmerge

Define a WDL workflow to merge jointly called VCF files. This workflow accepts input as array of reference URIs. The
reference URIs should be either Google Storage URLs or
[DRS](https://support.terra.bio/hc/en-us/articles/360039330211-Data-Access-with-the-GA4GH-Data-Repository-Service-DRS-)
URIs.

## Description

[Samtools](https://samtools.github.io/) is used to perform the merge. Each input VCF should describe a single
chromosome and should have equivilent headers.

In order to keep hard disk requirements small and improve performance, input/output objects are streamed directly from
cloud storage using FIFO queus (named pipes).

An appropriate workflow configuration is ~16GB RAM, ~8 CPUs, and standard storage.

## Runtime

Runtime varies with the number of VCFs to merge, the number of samples, runtime configuration, and other factors. The
table below may be helpful to understand the expected runtime for your workflow.

| cpu | memory | number of vcfs | average size | samples | runtime   |
| --- | ------ | -------------- | ------------ | ------- | --------- |
|   2 |    2GB | 2              | 2GB          | 2       | 0.9 hours | 
|   8 |   64GB | 2              | 2GB          | 2       | 0.7 hours | 
|   8 |   64GB | 2              | 5GB          | 5370    |   4 hours |
|   8 |   64GB | 5              | 5GB          | 4100    |  18 hours |
