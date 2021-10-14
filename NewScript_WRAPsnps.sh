**Cod Demography**
*by Group 1*



######################
#### Select SNPs #####
######################
#To run the script
sbatch WRAPsnps.sh Atlantic_cod_WG_ref_data.vcf.gz West_East_25

#Our actual command inside the script
python /cluster/projects/nn9987k/Seachanges/BAMscorer_v1_linux select_snps $VCF $OUT --numchrom 23 --map chrom_map --top 25

#Select SNPs script:

#!/bin/bash
#SBATCH --account=nn9987k
#SBATCH --time=01:00:00
#SBATCH --job-name=select_snps
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=4G

#set -o errexit

module --quiet purge
module load VCFtools/0.1.16-foss-2018b-Perl-5.28.0
module load PLINK/1.9b_6.13-x86_64
module load EIGENSOFT/7.2.1-intel-2018b
module load tabix/0.2.6-GCCcore-7.3.0
module load Anaconda3/2019.03
#module load BCFtools/1.9-intel-2018b

export PS1=\$

source ${EBROOTANACONDA3}/etc/profile.d/conda.sh

conda deactivate &>/dev/null

conda activate /cluster/projects/nn9987k/Seachanges/python3 #Change directory!!

VCF=$1
OUT=$2

#If you have a VCF that is already cut to the inversion site you only need args 1 and 2
#Use the --include flag to point the script to a BED file with the inversion start and end points
#Use the --map flag to point to a chromosome map to recode non-integer chromosomes to integers for PLINK and Eigensoft
#Use --numchrom to specify the number of chromosomes if doing whole-genome analysis
#Use --top to specify that you only want to include divergent SNPs with the top 25% of SNP loading weights

python /cluster/projects/nn9987k/Seachanges/BAMscorer_v1_linux select_snps $VCF $OUT --numchrom 23 --map chrom_map --top 25

#####################
#### Score Bams #####
#####################

Reference-style: 
![alt text][logo]

[logo]: (https://lh3.googleusercontent.com/FbiRJs0EAudHovAShGc09n2oQ0za3E6E2wZ4I-xQi_6NyeAXz8Elz-BMu9-l1WO2Gvg0WC9T1PASNnFEf1mzcGkl4hsrY361rEATUI7eSFhyHk6p=w1280) "Logo Title Text 2"
