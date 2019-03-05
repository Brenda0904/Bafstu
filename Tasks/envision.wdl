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
        }
    output{
        File outfile = outputDir + "envision_vcf.vcf"
        }
}
        
