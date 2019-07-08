python /exports/sascstudent/brenda/vep/ensembl-vep/envision.py /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700014_sorted.vcf > /exports/sascstudent/brenda/envision/envision_700014_sorted.vcf
python /exports/sascstudent/brenda/vep/ensembl-vep/envision.py /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700102_sorted.vcf > /exports/sascstudent/brenda/envision/envision_700102_sorted.vcf
python /exports/sascstudent/brenda/vep/ensembl-vep/envision.py /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700232_sorted.vcf > /exports/sascstudent/brenda/envision/envision_700232_sorted.vcf
python /exports/sascstudent/brenda/vep/ensembl-vep/envision.py /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700239_sorted.vcf > /exports/sascstudent/brenda/envision/envision_700239_sorted.vcf
python /exports/sascstudent/brenda/vep/ensembl-vep/envision.py /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700245_sorted.vcf > /exports/sascstudent/brenda/envision/envision_700245_sorted.vcf
python /exports/sascstudent/brenda/vep/ensembl-vep/envision.py /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/D1_sorted.vcf > /exports/sascstudent/brenda/envision/envision_D1_sorted.vcf

cat /exports/sascstudent/brenda/envision/human_predicted_combined_20170925.csv | head -n 1 > /exports/sascstudent/brenda/envision/envision_700014.csv
cat /exports/sascstudent/brenda/envision/human_predicted_combined_20170925.csv | head -n 1 > /exports/sascstudent/brenda/envision/envision_700102.csv
cat /exports/sascstudent/brenda/envision/human_predicted_combined_20170925.csv | head -n 1 > /exports/sascstudent/brenda/envision/envision_700232.csv
cat /exports/sascstudent/brenda/envision/human_predicted_combined_20170925.csv | head -n 1 > /exports/sascstudent/brenda/envision/envision_700239.csv
cat /exports/sascstudent/brenda/envision/human_predicted_combined_20170925.csv | head -n 1 > /exports/sascstudent/brenda/envision/envision_700245.csv
cat /exports/sascstudent/brenda/envision/human_predicted_combined_20170925.csv | head -n 1 > /exports/sascstudent/brenda/envision/envision_D1.csv

awk -F "[,/ ]" 'FNR==NR{a[$1,$2,$3]=$0;next}{if(b=a[$4,$5,$6]){print $0}}' /exports/sascstudent/brenda/envision/envision_700014_sorted.vcf /exports/sascstudent/brenda/envision/human_predicted_combined_20170925.csv >> /exports/sascstudent/brenda/envision/envision_700014.csv
awk -F "[,/ ]" 'FNR==NR{a[$1,$2,$3]=$0;next}{if(b=a[$4,$5,$6]){print $0}}' /exports/sascstudent/brenda/envision/envision_700102_sorted.vcf /exports/sascstudent/brenda/envision/human_predicted_combined_20170925.csv >> /exports/sascstudent/brenda/envision/envision_700102.csv
awk -F "[,/ ]" 'FNR==NR{a[$1,$2,$3]=$0;next}{if(b=a[$4,$5,$6]){print $0}}' /exports/sascstudent/brenda/envision/envision_700232_sorted.vcf /exports/sascstudent/brenda/envision/human_predicted_combined_20170925.csv >> /exports/sascstudent/brenda/envision/envision_700232.csv
awk -F "[,/ ]" 'FNR==NR{a[$1,$2,$3]=$0;next}{if(b=a[$4,$5,$6]){print $0}}' /exports/sascstudent/brenda/envision/envision_700239_sorted.vcf /exports/sascstudent/brenda/envision/human_predicted_combined_20170925.csv >> /exports/sascstudent/brenda/envision/envision_700239.csv
awk -F "[,/ ]" 'FNR==NR{a[$1,$2,$3]=$0;next}{if(b=a[$4,$5,$6]){print $0}}' /exports/sascstudent/brenda/envision/envision_700245_sorted.vcf /exports/sascstudent/brenda/envision/human_predicted_combined_20170925.csv >> /exports/sascstudent/brenda/envision/envision_700245.csv
awk -F "[,/ ]" 'FNR==NR{a[$1,$2,$3]=$0;next}{if(b=a[$4,$5,$6]){print $0}}' /exports/sascstudent/brenda/envision/envision_D1_sorted.vcf /exports/sascstudent/brenda/envision/human_predicted_combined_20170925.csv >> /exports/sascstudent/brenda/envision/envision_D1.csv

python /exports/sascstudent/brenda/vep/ensembl-vep/envision_filters.py /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700014_sorted.vcf /exports/sascstudent/brenda/envision/envision_700014.csv /exports/sascstudent/brenda/envision/700014_envision_filtered.vcf
python /exports/sascstudent/brenda/vep/ensembl-vep/envision_filters.py /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700014_sorted.vcf /exports/sascstudent/brenda/envision/envision_700102.csv /exports/sascstudent/brenda/envision/700102_envision_filtered.vcf
python /exports/sascstudent/brenda/vep/ensembl-vep/envision_filters.py /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700232_sorted.vcf /exports/sascstudent/brenda/envision/envision_700232.csv /exports/sascstudent/brenda/envision/700232_envision_filtered.vcf
python /exports/sascstudent/brenda/vep/ensembl-vep/envision_filters.py /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700239_sorted.vcf /exports/sascstudent/brenda/envision/envision_700239.csv /exports/sascstudent/brenda/envision/700239_envision_filtered.vcf
python /exports/sascstudent/brenda/vep/ensembl-vep/envision_filters.py /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700245_sorted.vcf /exports/sascstudent/brenda/envision/envision_700245.csv /exports/sascstudent/brenda/envision/700245_envision_filtered.vcf
python /exports/sascstudent/brenda/vep/ensembl-vep/envision_filters.py /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/D1_sorted.vcf /exports/sascstudent/brenda/envision/envision_D1.csv /exports/sascstudent/brenda/envision/D1_envision_filtered.vcf
