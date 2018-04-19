#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 14:00:00
#SBATCH -J 01_DNA_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user lovisa.lundberg.4321@student.uu.se

#Load modules
module load bioinfo-tools canu/1.7

#Commands
canu \
-p leptospirillum \
-d /home/lolu4321/genome_analysis_LovisaLundberg/analyses \
genomeSize=2.6m \
stopOnReadQuality=false \
-pacbio-raw /home/lolu4321/genome_analysis_LovisaLundberg/data/DNA_raw_data/ERR2028*.fastq.gz  
