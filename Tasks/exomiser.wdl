version 1.0

task exomiser{
    input{
        File vcf_file
        String outputDir
        String exomiser_jar
        String HPO_ids
        File ped_file
        }
    command{
        set -e -o pipefail
        mkdir -p ~{outputDir}
        java -Xmx200 -jar ${exomiser_jar} --prioritiser=hiphive -I AD -F 1 --hpo-ids ${HPO_ids} -p ${ped_file} -v ${vcf_file} --output-format VCF
    }
    output{
        File outfile = outputDir + "/exomiser_vcf.vcf"
    }
}
        
