### To merge reads from different runs. 

## Step 1 ##

# Get a list of your samples to make an array. 
# You can use an excel spreadsheet or edit strings in the command line:

cd <directory with all of your read files> 

#the file names should look something like this; 

BLTE39_S89_R1_001.fastq.gz
BLTE39_S89_R1_002.fastq.gz
BLTE39_S89_R2_001.fastq.gz
BLTE39_S89_R2_002.fastq.gz

#so you can use the name structure to list with ls, pipe | to the cut command | filter for unique occurances and print to a list.

ls *.gz | cut -d "_" -f1 | sort -u >> sample.list

# ls = list
# | = pipe, or send output of previous opteration to next operation.
# cut = cut string 
	# Options. these can be adjusted according to the nameing strings
	# -d "_" = delimiter for cut, here specifying underscore "_" as the character separating different fields
	# -f1 = specifies the field to be printed, in this case 1 indicates the first field, which will be whatever comes before the first underscore (e.g. BLTE39)
# | pipe again
# sort -u = sort and exclude (-u) duplicates 
# >> amend output to file = sample.list


### Step 2 ###
# set an array and catenate the files
array=$(cat sample.list) 

#check array
echo "$array"

#if it lists only one sample try this:
echo "${array[@]}"

#once you get a full printout of the list of samples do

for i in $array;  #or "${array[@]}"
do cat "$i"*R1*fastq.gz >> "$i"_R1_merged.fastq.gz; 
cat "$i"*R2*fastq.gz >> "$i"_R2_merged.fastq.gz; 
done

## That should do it. Set the array to one or two samples first, then try it. 

 