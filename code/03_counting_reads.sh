#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 10:00:00
#SBATCH -J 03_counting_reads
#SBATCH --mail-type=ALL
#SBATCH --mail-user lovisa.lundberg.4321@student.uu.se

#Load modules
module load bioinfo-tools htseq

path=$(echo /home/lolu4321/genome_analysis_LovisaLundberg/analyses_v2/RNA/mapping/)

for FILE in ERR2036629 ERR2036630 ERR2036631 ERR2036632 ERR2036633 ERR2117288 ERR2117289 \
ERR2117290 ERR2117291 ERR2117292; do 
htseq-count \
-f bam \
-r pos \
-t CDS \
-i ID \
$path*$FILE* \
/home/lolu4321/genome_analysis_LovisaLundberg/analyses_v2/annotation/copy_annotated.gff > /home/lolu4321/genome_analysis_LovisaLundberg/analyses_v2/read_count/read_count_$FILE;
done


