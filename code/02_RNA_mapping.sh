#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 06:00:00
#SBATCH -J 01_RNA_mapping
#SBATCH --mail-type=ALL
#SBATCH --mail-user lovisa.lundberg.4321@student.uu.se

#Load modules
module load bioinfo-tools bwa

#Commands
path = $/home/lolu4321/genome_analysis_LovisaLundberg/data/RNA_trimmed_data

for SRA in (ERR2036629 ERR2036630 ERR2036631) 
bwa mem \
-t 2 \
/home/lolu4321/genome_analysis_LovisaLundberg/analyses_v2/RNA/mapping/leptospirillum.contigs \

#sorting the data
samtools view -bS - > out.bam | samtools sort -bS - > out.bam
