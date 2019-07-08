cat /exports/sascstudent/brenda/envision/700014_envision_filtered.vcf | egrep ^# > /exports/sascstudent/brenda/envision/700014_single.vcf
cat /exports/sascstudent/brenda/envision/700014_envision_filtered.vcf | egrep -v ^# | awk '{if(length($4) == 1 && length($5) == 1) print $0}' >> /exports/sascstudent/brenda/envision/700014_single.vcf
cat /exports/sascstudent/brenda/envision/700232_envision_filtered.vcf | egrep ^# > /exports/sascstudent/brenda/envision/700232_single.vcf
cat /exports/sascstudent/brenda/envision/700232_envision_filtered.vcf | egrep -v ^# | awk '{if(length($4) == 1 && length($5) == 1) print $0}' >> /exports/sascstudent/brenda/envision/700232_single.vcf
cat /exports/sascstudent/brenda/envision/700239_envision_filtered.vcf | egrep ^# > /exports/sascstudent/brenda/envision/700239_single.vcf
cat /exports/sascstudent/brenda/envision/700239_envision_filtered.vcf | egrep -v ^# | awk '{if(length($4) == 1 && length($5) == 1) print $0}' >> /exports/sascstudent/brenda/envision/700239_single.vcf
cat /exports/sascstudent/brenda/envision/700245_envision_filtered.vcf | egrep ^# > /exports/sascstudent/brenda/envision/700245_single.vcf
cat /exports/sascstudent/brenda/envision/700245_envision_filtered.vcf | egrep -v ^# | awk '{if(length($4) == 1 && length($5) == 1) print $0}' >> /exports/sascstudent/brenda/envision/700245_single.vcf
cat /exports/sascstudent/brenda/envision/D1_envision_filtered.vcf | egrep ^# > /exports/sascstudent/brenda/envision/D1_single.vcf
cat /exports/sascstudent/brenda/envision/D1_envision_filtered.vcf | egrep -v ^# | awk '{if(length($4) == 1 && length($5) == 1) print $0}' >> /exports/sascstudent/brenda/envision/D1_single.vcf

python2.7 /exports/sascstudent/brenda/fathmm/fathmm_xf_query.py /exports/sascstudent/brenda/envision/700014_single.vcf -v -o fathmm_700014.vcf
python2.7 /exports/sascstudent/brenda/fathmm/fathmm_xf_query.py /exports/sascstudent/brenda/envision/700232_single.vcf -v -o fathmm_700232.vcf
python2.7 /exports/sascstudent/brenda/fathmm/fathmm_xf_query.py /exports/sascstudent/brenda/envision/700239_single.vcf -v -o fathmm_700239.vcf
python2.7 /exports/sascstudent/brenda/fathmm/fathmm_xf_query.py /exports/sascstudent/brenda/envision/700245_single.vcf -v -o fathmm_700245.vcf
python2.7 /exports/sascstudent/brenda/fathmm/fathmm_xf_query.py /exports/sascstudent/brenda/envision/D1_single.vcf -v -o fathmm_D1.vcf

python fathmm_filter.py /exports/sascstudent/brenda/envision/700014_envision_filtered.vcf /exports/sascstudent/brenda/fathmm/fathmm_700014.vcf /exports/sascstudent/brenda/fathmm/700014_final.vcf
python fathmm_filter.py /exports/sascstudent/brenda/envision/700102_envision_filtered.vcf /exports/sascstudent/brenda/fathmm/fathmm_700102.vcf /exports/sascstudent/brenda/fathmm/700102_final.vcf
python fathmm_filter.py /exports/sascstudent/brenda/envision/700232_envision_filtered.vcf /exports/sascstudent/brenda/fathmm/fathmm_700232.vcf /exports/sascstudent/brenda/fathmm/700232_final.vcf
python fathmm_filter.py /exports/sascstudent/brenda/envision/700239_envision_filtered.vcf /exports/sascstudent/brenda/fathmm/fathmm_700239.vcf /exports/sascstudent/brenda/fathmm/700239_final.vcf
python fathmm_filter.py /exports/sascstudent/brenda/envision/700245_envision_filtered.vcf /exports/sascstudent/brenda/fathmm/fathmm_700245.vcf /exports/sascstudent/brenda/fathmm/700245_final.vcf
python fathmm_filter.py /exports/sascstudent/brenda/envision/D1_envision_filtered.vcf /exports/sascstudent/brenda/fathmm/fathmm_D1.vcf /exports/sascstudent/brenda/fathmm/D1_final.vcf
