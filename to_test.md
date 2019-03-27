Variant Calling
==
DeepSVR
====

Installed --> Need BAM files

VCF-Annotation
==
CHASM
====

Need to create hg38 data.

Needs a mysql database.

Because it is too difficult and too low citations, we will not look into this anymore

FATHMM-XF
====
Installed 
Running on single nucleotide variants.
Runtime was very long, stopped it when it reached a week and a half, maybe use this after filtering using the other tools

1,5 weeks for 2.5 million/10 million queries.

DeepSEA
====
Installed --> Vcf format error, trying to convert small portion of vcf to version 4.1 or 4.0 and check if that works

CADD
====

Tested --> functional

ExPecto
===
Installed
Currently running

Protein Function Analysis
==

Envision
====

~0 (most damaging) to ~1 (most wild-type-like)

Vcf file with scores is created and can be merged with the other vcfs --> functional

Try to find a different way to annotate the vcf with the scores.



EVmutation --> Replaced with EVcouplings (python package)
====

Scores variants on the evolutionary constraint.

See where the most recent protein function information is stored/ how it is updated. --> Uniprot

Check whether the tool needs a connection to uniprot at the moment it is running



Variant Filtering
==

Exomiser
====

Installed --> works on data supplied by paper
Installed --> Run it using HPO ids.

Check whether to run it online or offline.
Online --> have to set a maximum of variants to analyse.
What information is stored to match the HPO ids to the genes.

Need to run it per family -> Ped file for each family
New version is installed, all the files have to be set right in the properties file


SomaticSeq
====

Maybe look into it later, because it is for somatic variants and is a merging tool
