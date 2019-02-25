version 1.0

task exomiser{
    input{
        File vcf_file
        String outputDir
        String exomiser_dir
        String HPO_ids
        File ped_file
        
