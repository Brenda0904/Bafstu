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
