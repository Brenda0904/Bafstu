version 1.0

import "common.wdl" as common

task vep{
    input {
	File vcf_file
	String outputDir
    }
    command{
        set -e -o pipefail
	mkdir -p ~{outputDir}
	vep \ 
	~{"-i" + vcf_file} \
	~{"--cache"} \
	~{"--output_file" + outfile} \ 
	~{--plugin "CADD"}
    }

    output{
        File outfile = outputDir + "/" + vcf_file + ".vep.results.vcf"
    }
}
