for f in *.vcf ; do vcf-sort $f > sorted_$f ; done
for g in sorted_* ; do bgzip -c $g > $g.gz ; done
for h in *.vcf.gz ; do tabix -p vcf $h ; done
vcf-merge *.vcf.gz > exomiser_multisample.vcf
