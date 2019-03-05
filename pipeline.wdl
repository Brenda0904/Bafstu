version 1.0

import "Tasks/variant_effect_predictor.wdl" as Vep
import "Tasks/exomiser.wdl" as Exomiser
#import "tasks/common.wdl" as common
#import "tasks/biopet/biopet.wdl" as biopet
#import "tasks/biopet/sampleconfig.wdl" as sampleconfig

workflow variant_pipeline {
    input{
        File vcf_file
        String outputDir
        String vep_location
        String cache_dir
        String exomiser_jar
        String HPO_ids
        File ped_file
        String envision_scores
    }
    String outputDirfile = outputDir + "/vep_vcf.vcf"
    call vep.vep as vep_task {
        input:
            vcf_file = vcf_file,
            vep_location = vep_location,
            cache_dir = cache_dir
    }
    output {
        File outfile = outputDirfile
    }
    String envisionDirfile = outputDir + "/envision_vcf.vcf"
    call Envision.envision as envision_task{
        input:
            File vcf_file
            String outputDir
            String envision_scores
    }
    output {
        File outfile = envisionDirfile
            
    call Exomiser.exomiser as exomiser_task{
        input:
            File vcf_file
            String outputDir
            String exomiser_jar
            String HPO_ids
            File ped_file
    }
    output {
        File outfile = outputDir + "/exomiser_vcf.vcf"
}
