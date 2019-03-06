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
Runtime was very long, stopped it when it reached a week and a half

DeepSEA
====
Installed --> torch installed, test further.

CADD
====

Tested --> functional

ExPecto
===
Installed
Memory error.

Protein Function Analysis
==

Envision
====

Need Uniprot ids

See where the most recent protein function information is stored/ how it is updated. --> Uniprot

~0 (most damaging) to ~1 (most wild-type-like)

Scores are obtained, have to see what to do with variants with multiple scores and merge the scores with the vcf file.



EVmutation --> Replaced with EVcouplings (python package)
====

Scores variants on the evolutionary constraint.

See where the most recent protein function information is stored/ how it is updated. --> Uniprot

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
To get the correct output format, a new version had to be installed, still downloading the last pieces of data.


SomaticSeq
====

Maybe look into it later, because it is for somatic variants and is a merging tool
