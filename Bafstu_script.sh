#!/bin/bash
#$ -S /bin/bash
#$ -q all.q
#$ -N bafstu
#$ -l h_vmem=5G
#$ -cwd
#$ -j Y
#$ -V
#$ -m be
#$ -M s1095204@student.hsleiden.nl
#$ -pe BWA 8

#This script executes all of the tools in the order: VEP, exomiser, envision, fathmmxf.
cd /exports/sascstudent/brenda/vep/ensembl-vep/
./vep -i /exports/sascstudent/brenda/multisample.final.vcf --offline --cache --dir_cache /exports/sascstudent/brenda/.vep/ --plugin CADD,/exports/sascstudent/brenda/vep/ensembl-vep/whole_genome_SNVs.tsv.gz,/exports/sascstudent/brenda/vep/ensembl-vep/InDels.tsv.gz --uniprot --protein --sift b --polyphen b --vcf --fork 8 --buffer_size 50 -o /exports/sascstudent/vep/ensembl-vep/vep_out.vcf
python /exports/sascstudent/brenda/vep/ensembl-vep/vep_filter.py /exports/sascstudent/brenda/vep/ensembl-vep/vep_out.vcf /exports/sascstudent/brenda/vep/ensembl-vep/vep_filtered.vcf
bash /exports/sascstudent/brenda/exomiser-cli-11.0.0/exomiser.sh
bash /exports/sascstudent/brenda/envision/envision.sh
bash /exports/sascstudent/brenda/fathmm/fathmmxf.sh
