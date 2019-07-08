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

cd /exports/sascstudent/brenda/vep/ensembl-vep/
./vep -i /exports/sascstudent/brenda/multisample.final.vcf --offline --cache --dir_cache /exports/sascstudent/brenda/.vep/ --plugin CADD,/exports/sascstudent/brenda/vep/ensembl-vep/whole_genome_SNVs.tsv.gz,/exports/sascstudent/brenda/vep/ensembl-vep/InDels.tsv.gz --uniprot --protein --sift b --polyphen b --vcf --fork 8 --buffer_size 50 -o /exports/sascstudent/vep/ensembl-vep/vep_out.vcf
python /exports/sascstudent/brenda/vep/ensembl-vep/vep_filter.py /exports/sascstudent/brenda/vep/ensembl-vep/vep_out.vcf /exports/sascstudent/brenda/vep/ensembl-vep/vep_filtered.vcf
python /exports/sascstudent/brenda/envision/envision_filter.py /exports/sascstudent/brenda/vep/ensembl-vep/vep_filtered.vcf /exports/sascstudent/brenda/envision/human_predicted_combined_20170925.csv /exports/sascstudent/brenda/envision/envision_filtered.vcf
python2.7 /exports/sascstudent/brenda/fathmm/fathmm_xf_query.py /exports/sascstudent/brenda/envision/envision_filtered.vcf -v -o /exports/sascstudent/brenda/fathmm/fathmm_out.vcf
python /exports/sascstudent/brenda/fathmm/fathmm_filter.py /exports/sascstudent/brenda/envision/envision_filtered.vcf /exports/sascstudent/brenda/fathmm/fathmm_out.vcf /exports/sascstudent/brenda/fathmm/fathmm_filtered.vcf
bcftools view -Oz -S /exports/sascstudent/brenda/exomiser-cli-11.0.0/samples_700014.txt /exports/sascstudent/brenda/fathmm/fathmm_filtered.vcf > /exports/sascstudent/brenda/exomiser-cli-11.0.0/family_700014.vcf
bcftools view -Oz -S /exports/sascstudent/brenda/exomiser-cli-11.0.0/samples_700102.txt /exports/sascstudent/brenda/fathmm/fathmm_filtered.vcf > /exports/sascstudent/brenda/exomiser-cli-11.0.0/family_700102.vcf
bcftools view -Oz -S /exports/sascstudent/brenda/exomiser-cli-11.0.0/samples_700232.txt /exports/sascstudent/brenda/fathmm/fathmm_filtered.vcf > /exports/sascstudent/brenda/exomiser-cli-11.0.0/family_700232.vcf
bcftools view -Oz -S /exports/sascstudent/brenda/exomiser-cli-11.0.0/samples_700239.txt /exports/sascstudent/brenda/fathmm/fathmm_filtered.vcf > /exports/sascstudent/brenda/exomiser-cli-11.0.0/family_700239.vcf
bcftools view -Oz -S /exports/sascstudent/brenda/exomiser-cli-11.0.0/samples_700245.txt /exports/sascstudent/brenda/fathmm/fathmm_filtered.vcf > /exports/sascstudent/brenda/exomiser-cli-11.0.0/family_700245.vcf
bcftools view -Oz -S /exports/sascstudent/brenda/exomiser-cli-11.0.0/samples_D1.txt /exports/sascstudent/brenda/fathmm/fathmm_filtered.vcf > /exports/sascstudent/brenda/exomiser-cli-11.0.0/family_D1.vcf
java -Xmx200g -jar /exports/sascstudent/brenda/exomiser-cli-11.0.0/exomiser-cli-11.0.0.jar --analysis /exports/sascstudent/brenda/exomiser-cli-11.0.0/analysis_file_700014.yml
java -Xmx200g -jar /exports/sascstudent/brenda/exomiser-cli-11.0.0/exomiser-cli-11.0.0.jar --analysis /exports/sascstudent/brenda/exomiser-cli-11.0.0/analysis_file_700232.yml
java -Xmx200g -jar /exports/sascstudent/brenda/exomiser-cli-11.0.0/exomiser-cli-11.0.0.jar --analysis /exports/sascstudent/brenda/exomiser-cli-11.0.0/analysis_file_700239.yml
java -Xmx200g -jar /exports/sascstudent/brenda/exomiser-cli-11.0.0/exomiser-cli-11.0.0.jar --analysis /exports/sascstudent/brenda/exomiser-cli-11.0.0/analysis_file_700245.yml
java -Xmx200g -jar /exports/sascstudent/brenda/exomiser-cli-11.0.0/exomiser-cli-11.0.0.jar --analysis /exports/sascstudent/brenda/exomiser-cli-11.0.0/analysis_file_D1.yml
java -Xmx200g -jar /exports/sascstudent/brenda/exomiser-cli-11.0.0/exomiser-cli-11.0.0.jar --analysis /exports/sascstudent/brenda/exomiser-cli-11.0.0/analysis_file_700102.yml
