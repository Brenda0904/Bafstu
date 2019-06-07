from vcf_parser import VCFParser
import sys

my_parser = VCFParser(infile=sys.argv[1], split_variants=True, check_info=True)
infile = open(sys.argv[2])
fathmm_file = infile.readlines()
infile.close()
headers = fathmm_file[0].strip('\n')
headers = headers.strip('# ')
headers = headers.split('\t')
print(headers)
chrom = headers.index('Chromosome')
ref = headers.index('Reference')
alt = headers.index('Mutant')
pos = headers.index('Position')
score = headers.index('Prediction')
variants = []
for variant in my_parser:
    chrom_var = variant['CHROM']
    ref_var = variant['REF']
    alt_var = variant['ALT']
    pos_var = variant['POS']
    info = variant['info_dict']
    print(chrom_var,ref_var,alt_var,pos_var)
    for x in range(1,len(fathmm_file)):
        try:
            line = fathmm_file[x].strip('\n')
            line = line.split(' ')
            if ("chr"+line[chrom]) == chrom_var and line[ref] == ref_var and line[alt] == alt_var and line[pos] == pos[var]:
                fathmm_score = line[score]
                info['fathmm'] = fathmm_score
                variants.append(variant)
                break
        except:
            pass
    if variant not in variants:
        info['fathmm'] = ''
        variants.append(variant)
outfile = open(sys.argv[3], "w")
for line in my_parser.metadata.print_header():
    outfile.write(line + '\n')
for variant in variants:
    if len(variant['info_dict']['fathmm']) == 0:
        outfile.write('\t'.join([variant[head] for head in my_parser.header])+ "\n")
        print("pass")
    elif float(variant['info_dict']['fathmm']) > 0.5:
        outfile.write('\t'.join([variant[head] for head in my_parser.header])+ "\n")
