# A short guide to assembling genomes
Here, we will use various scripts to take short read sequences (Illumina) for assembling genome contigs, and then a scaffold. This guide builds off of S. Baca's workflow with modifications by A. Gage.

## 0 - Concatenating reads
Multiple runs may be performed to obtain sequence data, which will result in multiple files. In our workflow, we want to merge these files into a single merged file per specimen.

### Organizing your files
First, change your directory to the location of your read files. This should be where all of your raw-data straight from sequencing should be.

    cd <directory with all read files>
    
Files should end in `*.fastq.gz`. These are Gzip compressed fastq files. Additionally, file names should be consistently named like this:

    BLTE39_S89_R1_001.fastq.gz
    BLTE39_S89_R1_002.fastq.gz
    BLTE39_S89_R2_001.fastq.gz
    BLTE39_S89_R2_002.fastq.gz

This way, we can use the name structure with `ls`, pipe `|` to the cut command, and then pipe to filter for unique occurrances and print to a list.

    ls *.gz | cut -d "_" -f1 | sort -u >> sample.list

### Concatenating your files
Now that we have `sample.list` to denote all of our read files, we can load this into an array:

    array=$(cat sample.list)

We can check the array using:

    echo "$array"
    
    # if only one sample is listed, you may need to try
    echo "${array[@]}"

From this array, we can now perform a loop to concatenate multiple read files into a single merged file on a per-specimen basis (ensure that your naming convention is consistent!). For this, we can use `0_concatenating_reads.sh`, which performs the following:

    #create array from sample.list file
    array=$(cat sample.list) 

    #catenate based on array
    for i in $array;
    do cat "$i"*R1*fastq.gz >> "$i"_R1_merged.fastq.gz; 
    cat "$i"*R2*fastq.gz >> "$i"_R2_merged.fastq.gz; 
    done

It is good practice to test this workflow for one or two samples before proceeding with the rest of your data.

## 1 - Pre-FastQC (Optional)
**We are skipping this step**

It may be worth checking the quality of your merged reads before cleaning your data (removing Illumina adapters, etc.). This can be achieved by running FastQC installed through a Conda environment via `1_optional_Fastqc.sh`, which does the following:

    module load fastqc/0.11.8 

    for i in ./*.fastq.gz; do fastqc $i; done

You can check the output files to get a preliminary report.

## 2 - FastP Processing
