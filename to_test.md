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

Look into the paper more to decide if it is worth the difficulty of installation.

FATHMM-XF
====
Installed --> Need to test

Apparently can only handle single base substitutions

# Chromosome    Position        Reference       Mutant  Coding  Noncoding       Prediction      Confidence
Traceback (most recent call last):
  File "/exports/sascstudent/brenda/fathmm/fathmm_xf_query.py", line 263, in <module>
    predList = getPrediction(data, query, predType)
  File "/exports/sascstudent/brenda/fathmm/fathmm_xf_query.py", line 125, in getPrediction
    for record in recordList.split("\n"):
TypeError: a bytes-like object is required, not 'str'

DeepSEA
====
Installed --> Need torch installed --> Email Michel

CADD
====

Tested --> functional

ExPecto
===
Installed, need to test

Protein Function Analysis
==

Envision
====

Need Uniprot ids

Look into the meaning of the score

See where the most recent protein function information is stored/ how it is updated. --> Uniprot

~0 (most damaging) to ~1 (most wild-type-like)

Look into the calculation of new scores.
Check the difference of the list w/ swissprot ids and the output vcf.



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


SomaticSeq
====

Maybe look into it later, because it is for somatic variants and is a merging tool
