from vcf_parser import VCFParser
import sys

my_parser = VCFParser(infile=sys.argv[1], split_variants=True, check_info=True)
infile = open(sys.argv[2])
envision_file = infile.readlines()
infile.close()
headers = envision_file[0].strip('\n')
headers = headers.split(',')
print(headers)
ref = headers.index('AA1')
alt = headers.index('AA2')
pos = headers.index('position')
prot = headers.index('Uniprot')
score = headers.index('Envision_predictions')
variants = []
for line in envision_file:
    line = line.strip('\n')
    line = line.split(',')
    try:
        for variant in my_parser:
            key = next(iter(variant['vep_info']))
            vep_info = variant['vep_info'][key][0]
            print(vep_info)
            aa_vep = vep_info['Amino_acids']
            pos_vep = vep_info['Protein_position']
            prot_vep = vep_info['SWISSPROT']
            info = variant['info_dict']
            envision_score = 0
            if len(aa_vep) == 1 and line[pos] == pos_vep and line[prot] == prot_vep and line[alt] == i:
                envision_score = line[score]
                info['envision'] = envision_score
                variants.append(variant)
            elif len(aa_vep) > 1:
                amino_acids = aa_vep.split("/")
                for i in amino_acids:
                    if line[pos] == pos_vep and line[prot] == prot_vep and line[alt] == i and envision_score < line[score]:
                        envision_score = line[score]
                if line[pos] == pos_vep and line[prot] == prot_vep:
                    info['envision'] = envision_score
                    variants.append(variant)
                else:
                    info['envision'] = ""
                    variants.append(variant)
            else:
                info['envision'] = ''
                variants.append(variant)
