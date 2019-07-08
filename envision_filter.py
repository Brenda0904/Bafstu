from vcf_parser import VCFParser
import sys

my_parser = VCFParser(infile=sys.argv[1], split_variants=True, check_info=True)
infile = open(sys.argv[2])
envision_file = infile.readlines()
infile.close()
headers = envision_file[0].strip('\n')
headers = headers.split(',')
ref = headers.index('AA1')
alt = headers.index('AA2')
pos = headers.index('position')
prot = headers.index('Uniprot')
score = headers.index('Envision_predictions')
variants = []
for variant in my_parser:
    try:
        key = next(iter(variant['vep_info']))
        vep_info = variant['vep_info'][key][0]
        aa_vep = vep_info['Amino_acids']
        pos_vep = vep_info['Protein_position']
        prot_vep = vep_info['SWISSPROT']
        info = variant['info_dict']
        for x in range(2,len(envision_file)):
            line = envision_file[x].strip('\n')
            line = line.split(',')
            if len(aa_vep) > 1:
                amino_acids = aa_vep.split("/")
                if line[pos] == pos_vep and line[prot] == prot_vep and line[ref] == amino_acids[0] and line[alt] == amino_acids[1]:
                    envision_score = line[score]
                    info['envision'] = envision_score
                    variants.append(variant)
                    break
    except:
        pass
outfile = open(sys.argv[3], "w")
for line in my_parser.metadata.print_header():
    outfile.write(line + '\n')
for variant in variants:
    if len(variant['info_dict']['envision']) == 0:
        outfile.write('\t'.join([variant[head] for head in my_parser.header])+ "\n")
    elif float(variant['info_dict']['envision']) > 0.5:
        outfile.write('\t'.join([variant[head] for head in my_parser.header])+ "\n")
outfile.close()
