version 1.0

import "Tasks/variant_effect_predictor.wdl" as Vep
#import "tasks/common.wdl" as common
#import "tasks/biopet/biopet.wdl" as biopet
#import "tasks/biopet/sampleconfig.wdl" as sampleconfig

workflow variant_pipeline {
    input{
        File vcf_file
        String outputDir
        String vep_location
        String cache_dir
    }
    String outputDirfile = outputDir + "/vep_output.vcf"
    call vep.vep as vep_task {
        input:
            vcf_file = vcf_file,
            vep_location = vep_location,
            cache_dir = cache_dir
    }
    output {
        File outfile = outputDirfile
    }
}
