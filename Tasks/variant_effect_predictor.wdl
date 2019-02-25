version 1.0

task vep {
    input {
        File vcf_file
        String outputDir
        String vep_location
        String cache_dir
    }
    command{
        set -e -o pipefail
        mkdir -p ~{outputDir}
        /exports/sascstudent/brenda/ensembl-vep/vep ~{"-i " + vcf_file} ~{"--cache " + cache_dir} ~{"--plugin CADD"} ~{"--uniprot"} ~{"--protein"}
    }
    output{
        File outfile = outputDir + "/vep_vcf.vcf"
    }
}

