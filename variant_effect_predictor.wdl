workflow variant_effect_predictor{
	call vep
}

task vep{
	File script_vep
	File vcf_file
	String outdirpath
	command{
		set -e -o pipefail
		mkdir -p ~{outdirpath}
		script_vep \ 
		~{"-i" + vcf_file} \
		~{"--cache"} \
		~{"--output_file" + outfile} \ 
		~{--plugin "CADD"}
	}

	output{File outfile = outdirpath + "/" + vcf_file + ".vep.results.vcf"}
}