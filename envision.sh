#envision.py is run to obtain the protein information from the variants in the exomiser output.
python /exports/sascstudent/brenda/vep/ensembl-vep/envision.py /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700014_sorted.vcf > /exports/sascstudent/brenda/envision/envision_700014_sorted.vcf
python /exports/sascstudent/brenda/vep/ensembl-vep/envision.py /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700102_sorted.vcf > /exports/sascstudent/brenda/envision/envision_700102_sorted.vcf
python /exports/sascstudent/brenda/vep/ensembl-vep/envision.py /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700232_sorted.vcf > /exports/sascstudent/brenda/envision/envision_700232_sorted.vcf
python /exports/sascstudent/brenda/vep/ensembl-vep/envision.py /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700239_sorted.vcf > /exports/sascstudent/brenda/envision/envision_700239_sorted.vcf
python /exports/sascstudent/brenda/vep/ensembl-vep/envision.py /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700245_sorted.vcf > /exports/sascstudent/brenda/envision/envision_700245_sorted.vcf
python /exports/sascstudent/brenda/vep/ensembl-vep/envision.py /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/D1_sorted.vcf > /exports/sascstudent/brenda/envision/envision_D1_sorted.vcf

#For each family, a subset csv file consisting of the information found in the original envision csv file for the variants in the current VCF file will be made.
#First, each file is created using the header from the original csv file.
cat /exports/sascstudent/brenda/envision/human_predicted_combined_20170925.csv | head -n 1 > /exports/sascstudent/brenda/envision/envision_700014.csv
cat /exports/sascstudent/brenda/envision/human_predicted_combined_20170925.csv | head -n 1 > /exports/sascstudent/brenda/envision/envision_700102.csv
cat /exports/sascstudent/brenda/envision/human_predicted_combined_20170925.csv | head -n 1 > /exports/sascstudent/brenda/envision/envision_700232.csv
cat /exports/sascstudent/brenda/envision/human_predicted_combined_20170925.csv | head -n 1 > /exports/sascstudent/brenda/envision/envision_700239.csv
cat /exports/sascstudent/brenda/envision/human_predicted_combined_20170925.csv | head -n 1 > /exports/sascstudent/brenda/envision/envision_700245.csv
cat /exports/sascstudent/brenda/envision/human_predicted_combined_20170925.csv | head -n 1 > /exports/sascstudent/brenda/envision/envision_D1.csv

#Next, each variant that is both in the exomiser result and the original csv file will be added to the subset csv.
#The two files are compared using the Uniprot id, the protein position and the alternative protein.
awk -F "[,/ ]" 'FNR==NR{a[$1,$2,$3]=$0;next}{if(b=a[$4,$5,$6]){print $0}}' /exports/sascstudent/brenda/envision/envision_700014_sorted.vcf /exports/sascstudent/brenda/envision/human_predicted_combined_20170925.csv >> /exports/sascstudent/brenda/envision/envision_700014.csv
awk -F "[,/ ]" 'FNR==NR{a[$1,$2,$3]=$0;next}{if(b=a[$4,$5,$6]){print $0}}' /exports/sascstudent/brenda/envision/envision_700102_sorted.vcf /exports/sascstudent/brenda/envision/human_predicted_combined_20170925.csv >> /exports/sascstudent/brenda/envision/envision_700102.csv
awk -F "[,/ ]" 'FNR==NR{a[$1,$2,$3]=$0;next}{if(b=a[$4,$5,$6]){print $0}}' /exports/sascstudent/brenda/envision/envision_700232_sorted.vcf /exports/sascstudent/brenda/envision/human_predicted_combined_20170925.csv >> /exports/sascstudent/brenda/envision/envision_700232.csv
awk -F "[,/ ]" 'FNR==NR{a[$1,$2,$3]=$0;next}{if(b=a[$4,$5,$6]){print $0}}' /exports/sascstudent/brenda/envision/envision_700239_sorted.vcf /exports/sascstudent/brenda/envision/human_predicted_combined_20170925.csv >> /exports/sascstudent/brenda/envision/envision_700239.csv
awk -F "[,/ ]" 'FNR==NR{a[$1,$2,$3]=$0;next}{if(b=a[$4,$5,$6]){print $0}}' /exports/sascstudent/brenda/envision/envision_700245_sorted.vcf /exports/sascstudent/brenda/envision/human_predicted_combined_20170925.csv >> /exports/sascstudent/brenda/envision/envision_700245.csv
awk -F "[,/ ]" 'FNR==NR{a[$1,$2,$3]=$0;next}{if(b=a[$4,$5,$6]){print $0}}' /exports/sascstudent/brenda/envision/envision_D1_sorted.vcf /exports/sascstudent/brenda/envision/human_predicted_combined_20170925.csv >> /exports/sascstudent/brenda/envision/envision_D1.csv

#Next, each of the variants that has a score higher than 0.5 will be written to the envision output file for each family.
python /exports/sascstudent/brenda/vep/ensembl-vep/envision_filters.py /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700014_sorted.vcf /exports/sascstudent/brenda/envision/envision_700014.csv /exports/sascstudent/brenda/envision/700014_envision_filtered.vcf
python /exports/sascstudent/brenda/vep/ensembl-vep/envision_filters.py /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700014_sorted.vcf /exports/sascstudent/brenda/envision/envision_700102.csv /exports/sascstudent/brenda/envision/700102_envision_filtered.vcf
python /exports/sascstudent/brenda/vep/ensembl-vep/envision_filters.py /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700232_sorted.vcf /exports/sascstudent/brenda/envision/envision_700232.csv /exports/sascstudent/brenda/envision/700232_envision_filtered.vcf
python /exports/sascstudent/brenda/vep/ensembl-vep/envision_filters.py /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700239_sorted.vcf /exports/sascstudent/brenda/envision/envision_700239.csv /exports/sascstudent/brenda/envision/700239_envision_filtered.vcf
python /exports/sascstudent/brenda/vep/ensembl-vep/envision_filters.py /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700245_sorted.vcf /exports/sascstudent/brenda/envision/envision_700245.csv /exports/sascstudent/brenda/envision/700245_envision_filtered.vcf
python /exports/sascstudent/brenda/vep/ensembl-vep/envision_filters.py /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/D1_sorted.vcf /exports/sascstudent/brenda/envision/envision_D1.csv /exports/sascstudent/brenda/envision/D1_envision_filtered.vcf
