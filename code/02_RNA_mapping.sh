#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 12:00:00
#SBATCH -J 01_RNA_mapping
#SBATCH --mail-type=ALL
#SBATCH --mail-user lovisa.lundberg.4321@student.uu.se

#Load modules
module load bioinfo-tools bwa
module load samtools

path=$(echo /home/lolu4321/genome_analysis_LovisaLundberg/data/RNA_trimmed_data/)

#Commands
for FILE in ERR2036629 ERR2036630 ERR2036631 ERR2036632 ERR2036633 ERR2117288 ERR2117289 \
ERR2117290 ERR2117291 ERR2117292; do
bwa mem \
-t 2 \
/home/lolu4321/genome_analysis_LovisaLundberg/analyses_v2/RNA/mapping/leptospirillum.contigs \
$path$FILE\_P1.trim* \
$path$FILE\_P2.trim* | samtools view -bS - | samtools sort - > /home/lolu4321/genome_analysis_LovisaLundberg/analyses_v2/RNA/mapping/leptospirillum_$FILE.contigs_alignment.bam;
done
