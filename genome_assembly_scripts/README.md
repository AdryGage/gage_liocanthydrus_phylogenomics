# A short guide to assembling genomes
Here, we will use various scripts to take short read sequences (Illumina) for assembling genome contigs, and then a scaffold. This guide builds off of S. Baca's workflow with modifications by A. Gage.

## 0 - Concatenating reads
Multiple runs may be performed to obtain sequence data, which will result in multiple files. Additionally, sequencing is typically performed bidirectionally, producing "forward" and "reverse" reads. In our workflow, we want to merge these files into a single merged file per direction per specimen.

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

## 1 - Pre-Trim FastQC (Optional)
**We are skipping this step**

It may be worth checking the quality of your merged reads before cleaning your data (removing Illumina adapters, etc.). This can be achieved by running FastQC installed through a Conda environment via `1_optional_Fastqc.sh`, which does the following:

    module load fastqc/0.11.8 

    for i in ./*.fastq.gz; do fastqc $i; done

You can check the output files to get a preliminary report.

## 2 - FastP Processing
Now, we will run our merged sequence data through FastP to trim the adapters. In this workflow, we are running FastP from a Conda environment, which can be set up like this:

    conda create -p /work/adry/conda/envs/fastp
    conda install bioconda::fastp

Next, we will run a script that loops FastP to clean each individual merged FastQ file. **Check your file names:** if you followed the code and scripts in this guide so far, you should have a single "R1" and "R2" `*merged.fastq.gz` file per specimen. If you don't, go back and rename them accordingly.

Let's run the `2_fastp.sh` script, which does this:

    module load conda

    conda init
    source activate /work/adry/conda/envs/fastp

    for i in *R1_merged.fastq.gz; 
    do TRIMNAME1=`echo $i | sed 's/.fastq.gz/.clean.fastq.gz/g'`;
    TRIMNAME2=`echo $TRIMNAME1 | sed 's/R1/R2/g'`;
    REVERSE=`echo $i | sed 's/R1/R2/g'`;
    UNPAIRED=`echo $TRIMNAME1 | sed 's/clean.fastq.gz/clean.singleton.fastq.gz/g'`;
    UNPAIRED2=`echo $TRIMNAME1 | sed 's/clean.fastq.gz/clean.singleton.fastq.gz/g'`;

    fastp -w 8 -i $i -I $REVERSE -o clean_reads/$TRIMNAME1 -O clean_reads/$TRIMNAME2 --unpaired1 clean_reads/$UNPAIRED --unpaired2 clean_reads/$UNPAIRED2 -q 20 -l 30 -w 6 --detect_adapter_for_pe -g;
    done 

As is, this will run FastP to clean the reads using typical adapter sequences, but you can use `--adapter_fasta adapter_list.fasta` to specify adapter sequences. Additionally, `--overrepresentation_analysis` can be used for garnering characteristics of the genome, but we are skipping it here.

Arguments:

    -q      --qualified_quality_phred (default is 15)
    -l      --length_required (default is 15)
    -w      --thread (multi-threading, default is 3)
    -g      --trim_poly_g (forces polyG tail trimming)
    -2      --detect_adapter_for_pe (enable paired-end detection to produce ultra-clean data)

You will now have a single `*.clean.fastq.gz file` per sample in a newly created `clean_reads/` directory.

## 3 - Post-Trim FastQC ("FastQ Quality Control")
To get a quick check of our merged and cleaned reads, we will run FastQC to inspect the quality. FastQC can generate HTML reports, which is how we will be using it. Recall that FastQC was mentioned in step 1, which we skipped previously.

We run FastQC as a Conda environment, which is set up like this:

    conda create -p /work/adry/conda/envs/fastqc
    conda install bioconda::fastqc

Then, we run 3_Fastqc.sh:

    module load conda

    conda init
    source activate /work/adry/conda/envs/fastqc

    for i in ./clean_reads/*clean*.gz; do fastqc $i; done

**NOTE: Check that your file names are consistent! Otherwise, the script will not work or will need to be edited.**

FastQC will then generate multiple output files - you can open the HTML files to quickly view the reports.

## 4 - Jellyfish (Optional)
**We are skipping this step**


## 5 - Jellyfish Histo (Optional)
**We are skipping this step**


## 6 - Genomescope (Optional)
**We are skipping this step**


## 7 - BBDuk filter (Optional)
**We are skipping this step**


## 8 - SPAdes Genome Assembly
**NOTE: As SPAdes uses increasingly larger k-mer sizes, more RAM will be required. Read https://ablab.github.io/spades/datatypes.html and plan your HPC usage accordingly. You may also specify shorter k-mer sizes, but this is not advisable.**

Now, we are ready to assemble our genome scaffolds via SPAdes. Again, we are using a Conda environment to achieve this.

    conda create -p /work/adry/conda/envs/spades
    conda install bioconda::spades

Start by changing to your directory that contains your merged/cleaned files (FastP output). For each clean fastq file, we will need to run an individual script. Therefore, we will create multiple SPAdes scripts using a template. This can be done by reusing the `sample.list` file we created from before. From that, we can create an array and run a loop to create each corresponding SPAdes script from `8_newSPAdes_template.sh`. This template is as follows:

    module load conda
    module load java

    conda init
    source activate /work/adry/conda/envs/SPAdes

    ###do an assembly using the adapter-filtered data as input; modify names and paths as needed
    ###Here set to run with reads all in same directory: Can also modify to make directories for each samples' reads if need be

    spades.py -1 ./INDIV_R1_merged.clean.fastq.gz -2 ./INDIV_R2_merged.clean.fastq.gz -o ./assemblies/INDIV -t 28 -m 2048

This template should be saved in your current directory, from which we will then run:

    array=`cat sample.list`

Check your array if needed:

    echo $array  #depending on the list format you may have to use this synax: echo "${array[@]}"   

Then generate multiple scripts from the `8_new_SPAdes_template.sh` template (this should be in your current directory):

    for i in $array; do awk '{gsub("INDIV","'$i'",$0); print($0);}' 8_new_SPAdes_template.sh > SPADES_"$i".sh; done  

Here, we are replacing INDIV from the template with the names listed in `sample.list`. **If your naming convention has not been consistent with this guide, this will not work.**

Once you have generated all of your SPAdes scripts, you can then run this loop command to submit all of them at once:

    for i in $array; do sbatch SPADES_"$i".sh; done

If your SPAdes jobs get interrupted (i.e. runtime limits), you can use the `--continue` arguement to an already existing SPAdes assembly output directory:

    spades.py --continue  -o ./assemblies/INDIV

Additional information for using SPAdes:

    USAGE: -1, -2 = <cleaned, (optionally filtered with bbduk) forward and reverse read files>; -s = <cleaned singleton read file>; -o <output directory> (doesn't have to me pre-made); -t <threads>

## 9 - Genome Quality Assessment (QUAST)
Now that we have our genome assemblies, we will want to assess their qualities usint QUAST (https://github.com/ablab/quast). The standard usage for QUAST is as follows:

    quast	./assemblies/INDIV/scaffolds.fasta \
	./assemblies/INDIV/contigs.fasta \
	-o INDIV_quast_out \
	#-t 4

where `INDIV` should be your specimen ID from previous steps, `-o` specifies the output directory (in this case, in the same working directory). You can view the full list of QUAST arguments here: https://quast.sourceforge.net/docs/manual.html

Depending on how you organized your genome assemblies, you can either run the command above one-by-one for each specimen, or, if you have not ommitted any samples, experienced no errors, and followed this guide to a tee, you can run it in a loop using the `sample.list` like this:

    module load quast
    module load java
    
    array=$(cat sample.list)

    for INDIV in $array; do
	quast	./assemblies/"$INDIV"/scaffolds.fasta \
	./assemblies/"$INDIV"/contigs.fasta \
	-o "$INDIV"_quast_out \
    -b  # enables BUSCO - only works on Linux
    -e  # forces BUSCO to use eukaryotic database
	#-t 4   # threads, omit to default to 25% CPU usage

Otherwise, edit the `9_Quast.sh` script or `sample.list` as necessary. In our usage, we will want to use the following arguments:

    --large # for genomes > 100 Mbp (runs QUAST-LG). Liocanthydrus genomes are ~250 Mbp.
    -b  # enables BUSCO search (only works on Linux)
    -e  # forces BUSCO to use eukaryotic database and gene finding to use GeneMark-ES
    -f  # enables gene finding (PERFORMANCE WARNING)
    -

In essence, QUAST will read the scaffolds and contigs for each sample and generate a report. The output directory will contain multiple files - you can open the `report.pdf` file to get a quick overview. The `report.html` and `icarus.html` files will give more comprehensive details, but they may depend on files from the `basic_stats` and `icarus_viewers` sub-directories - it is best to download the entire QUAST output directory and view directly on your local machine to avoid issues.

### *Special Installation Instructions*

If you install QUAST through Bioconda, GeneMark will be excluded due to distribution licensing limitations and must be manually added. `quast_libs/genemark` from https://github.com/ablab/quast can be downloaded and added to `<conda_environment_containing_QUAST_installation>/lib/phython<ver>/site-packages/quast_libs`.

In my usage, I need to edit  the `quast_libs/run_busco.py` file to use the odb12 databases, as found here: https://busco-archive.ezlab.org/data/lineages/

Additionally, for *Liocanthydrus*, it may be appropriate to use a Coleoptera specific database.

## 10 - Genome Completeness Assessment (BUSCO)
***NOTE:** While QUAST has built-in BUSCO functionality, it is broken in the current 5.3.0 version due to reliance on the older V9 OrthoDB, which is no longer publicly available. Therefore, we are running BUSCO directly.*

To assess the completeness of our assembled genomes, we will run BUSCO.

Like other programs, we will create a new Conda environment for BUSCO.

    conda create -p /work/adry/conda/envs/busco_6.0.0
    conda install bioconda::busco

As we previously did for SPAdes, we can create individual BUSCO scripts for each sample using the sample.list. We'll start with a template script (`10_busco_template.sh`):

    module load conda

    conda init
    source activate /work/adry/conda/envs/busco_6.0.0

  busco -i /work/adry/processing_room/assemblies/INDIV/contigs.fasta -m genome -o INDIV_BUSCO --out_path /work/adry/processing_room/assemblies/INDIV --auto-lineage --plot /work/adry/processing_room/assemblies/INDIV/busco/ -c 64

Here, INDIV is our familiar placeholder that will get replaced with the sample name. I am running busco with the following parameters:

    -i      # input file - using the contigs.fasta from SPAdes
    -o      # output name
    --out_path      # output directory - I prefer to put this directly into the sample's assembly folder
    -m      # mode - using genome
    --auto-lineage  # detects best OrthoDB dataset from input from best phylogenetic match for eukaryotes, archaea, and bacteria. This is particularly important because it will help us diagnose for contamination in our data.
    -l      # not used here, but this is where you would specify the dataset to use. Run `busco --list-datasets` to see what is available for download.
    -c      # CPU threads. In BUSCO v6.0.0 installed via BioConda, tBLASTn should no longer have a multithreading issue.

