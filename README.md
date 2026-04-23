# Liocanthydrus Phylogenomics
A script repository for Adry Gage's phylogenomic workflow on studying *Liocanthydrus*.

![A cartoon drawing depicting the overall workflow of extracting DNA from specimens, processing DNA through Illumina sequencing, assembling genomes, harvesting UCEs, and creating a phylogeny tree.](assets/images/diagrams/from_genomes_to_trees.png)
> A very "high quality" diagram showing the overall process of taking genomes from *Liocanthydrus* beetles to construct phylogeny trees.

## Script Usage
The scripts stored in this repository are designed to work with Louisiana State University's (LSU's) HPC servers, but should work for any Slurm-based system. These scripts depend on many different software applications (credited below), but may call upon outdated versions. If using these scripts for your own analysis, be sure to implement the necessary adjustments to utilize the desired software versions. Otherwise, if you are perhaps focused on reproducibility, take note ensure you have the appropriate software versions installed as described in the scripts.

This workflow is designed primarily for investigating the phylogenomics of Neotropical aquatic beetles, but it is widely applicable to all insects and, at large, any molecular-based systematic study.

### LSU HPC Job Submission
SuperMike-III (dubbed 'mike') has 171 nodes, each with 64 CPU cores and 256 GBs of RAM. The Slurm directives are thus specified to make full use of each individual node. https://www.hpc.lsu.edu/docs/guides.php?system=SuperMike3. 

All scripts should contain these basic directives:

    #SBATCH -J job
Job name

    #SBATCH -N 1        
 Number of nodes

    #SBATCH -A allocation
If you have multiple compute-hour allocations, specify which one you'd like to use for this job. When this is omitted, LSU's HPC will charge hours from your default allocation (check your HPC account settings).

    #SBATCH -n 64       
Number of cores. This should be equal to 64*'Number of nodes', unless using `single` partition. Jobs submitted to the `single` partition can be allocated to 1-64 cores.

    #SBATCH -c 1
Number of threads per process
    
    #SBATCH -t 36:00:00
Time allocation. For LSU's mike, you are limited to 3 days on the `workq` partition. 
    
    #SBATCH -p workq
Specify the server partition you'd like your job to run on. LSU's mike has 3 partitions: `workq` for most jobs, `single` for jobs requiring only a single node, and `bigmem` for jobs require large volumes of RAM. These partitions are identical, except `bigmem` has 2 TB of RAM instead of the standard 256 GBs, and `single` will allow you to specify anywhere from 1-64 CPU cores to be allocated for your job.

    #SBATCH -e ./error_out/_%j.err
Error log file output. Use %j to copy the job name in the file name, which allows you to quickly find it. You can also specify a path if you'd like your error log file to go into a specific directory. I prefer to add an underscore `_` at the beginning of the file name to help separate it from other documents in my directory.

    #SBATCH -o ./log_out/_%j.log     
Log file output. Use %j to copy the job name in the file name, which allows you to quickly find it. You can also specify a path if you'd like your log file to go into a specific directory. I prefer to add an underscore `_` at the beginning of the file name to help separate it from other documents in my directory.


    #SBATCH --mail-type=ALL
Specify the type of email notifications. `ALL` for everything, `END` for completed jobs, and `FAIL` for failed jobs. I prefer `ALL` to keep track of overall job progress.

    #SBATCH --mail-user=your@email.com
Specify the email address to send notifications - you are usually restricted to whatever email your HPC account is set up with.

#### ***Copy-Paste Block***
Use this as a template for creating/editing scripts.

```
#!/bin/bash
#SBATCH -J job_name
#SBATCH -A allocation
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -c 1
#SBATCH -t 24:00:00
#SBATCH -p single
#SBATCH -e _error_%j.err
#SBATCH -o _log_%j.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user=my@email.com
```