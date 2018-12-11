version 1.0

import "Tasks/variant_effect_predictor.wdl" as Vep
#import "tasks/common.wdl" as common
#import "tasks/biopet/biopet.wdl" as biopet
#import "tasks/biopet/sampleconfig.wdl" as sampleconfig

workflow pipeline {
	input {
    	File vcf
		String outputDir
	}
	call Vep.vep as VEP {
		input:
			vcf_file = vcf
			outputDir = outputDir
	}
	output {
	}
