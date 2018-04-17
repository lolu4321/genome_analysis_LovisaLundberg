#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 13:00:00
#SBATCH -J 01_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user lovisa.lundberg.4321@student.uu.se

#Load modules
module load bioinfo-tools

#Commands
canu -assemble \
-p 01_genome_assembly  -d #directory  \
genomeSize= \
stopOnReadQuality=false \  
