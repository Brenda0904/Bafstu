version 1.0

task envision {
    input {
        File vcf_file
        String outputDir
        String envision_scores
        }
    command{
        set -e -o pipefail
        mkdir -p ~{outputDir}
        geparst = python ~{parse_script} ~{vcf_file} 
        envision_score = awk -F"[,\ ]" 'FNR==NR{a[$6,$7,$9]=$0;next}{if(b=a[$6,$5,$4]){print b " " $35}}' ${geparst} ${envision_scores}
        envision_score += (awk -F"[,\ ]" 'FNR==NR{a[$6,$7,$8]=$0;next}{if(b=a[$6,$5,$4]){print b " " $35}}' geparst_sc.vcf ${envision_scores}
        envision_vcf = echo '##INFO=<ID=ENV,Number=1,Type=Float,Description="Envision prediction of quantitative mutational effects"'
        envision_vcf += echo "#CHROM POS ID REF ALT INFO"
        envision_vcf += awk '{k=$1 OFS $2 OFS $3 OFS $4 OFS $5} $10>a[k]{a[k]=$10} END{for (i in a) print i, "ENV=" a[i]} ";"' highest_scores
        }
    output{
        File outfile = outputDir + ".vcf"
        }
}
        
