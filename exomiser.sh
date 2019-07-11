#The original multisample VCF file is split into the six different families. 
#Samples_700014.txt, for example, contains a list of samples in family 700014.
bcftools view -Ov -S /exports/sascstudent/brenda/samples_700014.txt /exports/sascstudent/brenda/vep_filtered.vcf > /exports/sascstudent/brenda/exomiser-cli-11.0.0/family_700014.vcf
bcftools view -Ov -S /exports/sascstudent/brenda/samples_700102.txt /exports/sascstudent/brenda/vep_filtered.vcf > /exports/sascstudent/brenda/exomiser-cli-11.0.0/family_700102.vcf
bcftools view -Ov -S /exports/sascstudent/brenda/samples_700232.txt /exports/sascstudent/brenda/vep_filtered.vcf > /exports/sascstudent/brenda/exomiser-cli-11.0.0/family_700232.vcf
bcftools view -Ov -S /exports/sascstudent/brenda/samples_700239.txt /exports/sascstudent/brenda/vep_filtered.vcf > /exports/sascstudent/brenda/exomiser-cli-11.0.0/family_700239.vcf
bcftools view -Ov -S /exports/sascstudent/brenda/samples_700245.txt /exports/sascstudent/brenda/vep_filtered.vcf > /exports/sascstudent/brenda/exomiser-cli-11.0.0/family_700245.vcf
bcftools view -Ov -S /exports/sascstudent/brenda/samples_D1.txt /exports/sascstudent/brenda/vep_filtered.vcf > /exports/sascstudent/brenda/exomiser-cli-11.0.0/family_D1.vcf

#Exomiser is run for each of the six VCF files that were just created by splitting the families.
java -Xmx200g -jar /exports/sascstudent/brenda/exomiser-cli-11.0.0/exomiser-cli-11.0.0.jar --analysis /exports/sascstudent/brenda/exomiser-cli-11.0.0/analysis_file_700014.yml
java -Xmx200g -jar /exports/sascstudent/brenda/exomiser-cli-11.0.0/exomiser-cli-11.0.0.jar --analysis /exports/sascstudent/brenda/exomiser-cli-11.0.0/analysis_file_700232.yml
java -Xmx200g -jar /exports/sascstudent/brenda/exomiser-cli-11.0.0/exomiser-cli-11.0.0.jar --analysis /exports/sascstudent/brenda/exomiser-cli-11.0.0/analysis_file_700239.yml
java -Xmx200g -jar /exports/sascstudent/brenda/exomiser-cli-11.0.0/exomiser-cli-11.0.0.jar --analysis /exports/sascstudent/brenda/exomiser-cli-11.0.0/analysis_file_700245.yml
java -Xmx200g -jar /exports/sascstudent/brenda/exomiser-cli-11.0.0/exomiser-cli-11.0.0.jar --analysis /exports/sascstudent/brenda/exomiser-cli-11.0.0/analysis_file_D1.yml
java -Xmx200g -jar /exports/sascstudent/brenda/exomiser-cli-11.0.0/exomiser-cli-11.0.0.jar --analysis /exports/sascstudent/brenda/exomiser-cli-11.0.0/analysis_file_700102.yml

#Each of the output files from exomiser is sorted so it can be used to run the next tool. 
#In order to sort the VCF files, they have to be compressed first.
bgzip /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700014.vcf
vcf-sort /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700014.vcf.gz > 700014_sorted.vcf
bgzip /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700014_sorted.vcf
tabix -p /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700014_sorted.vcf.gz
bgzip -d /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700014_sorted.vcf.gz

bgzip /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700102.vcf
vcf-sort /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700102.vcf.gz > 700102_sorted.vcf
bgzip /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700102_sorted.vcf
tabix -p /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700102_sorted.vcf.gz
bgzip -d /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700102_sorted.vcf.gz

bgzip /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700232.vcf
vcf-sort /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700232.vcf.gz > 700232_sorted.vcf
bgzip /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700232_sorted.vcf
tabix -p /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700232_sorted.vcf.gz
bgzip -d /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700232_sorted.vcf.gz

bgzip /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700239.vcf
vcf-sort /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700239.vcf.gz > 700239_sorted.vcf
bgzip /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700239_sorted.vcf
tabix -p /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700239_sorted.vcf.gz
bgzip -d /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700239_sorted.vcf.gz

bgzip /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700245.vcf
vcf-sort /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700245.vcf.gz > 700102_sorted.vcf
bgzip /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700245_sorted.vcf
tabix -p /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700245_sorted.vcf.gz
bgzip -d /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/700245_sorted.vcf.gz

bgzip /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/D1.vcf
vcf-sort /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/D1.vcf.gz > D1_sorted.vcf
bgzip /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/D1_sorted.vcf
tabix -p /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/D1_sorted.vcf.gz
bgzip -d /exports/sascstudent/brenda/exomiser-cli-11.0.0/results/D1_sorted.vcf.gz
