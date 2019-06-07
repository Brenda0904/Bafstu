from vcf_parser import VCFParser
import sys

my_parser = VCFParser(infile=sys.argv[1], split_variants=True, check_info=True)
remaining = []
for variant in my_parser:
    key = next(iter(variant['vep_info']))
    try:
        info = variant['vep_info'][key][0]
        sift = info['SIFT']
        polyphen = info['PolyPhen']
        cadd = info['CADD_PHRED']
        print(float(sift), float(polyphen), float(cadd))
        if len(cadd) != 0 or len(sift) != 0 or len(polyphen) !=0:
            if len(cadd) == 0:
                cadd = 100
            if len(sift) == 0:
                sift = 0
            if len(polyphen) == 0:
                polyphen = 1
            if float(sift) < 0.05 and float(polyphen) > 0.446 and float(cadd) > 15:
                remaining.append(variant)
                print('passed')
            else:
                print('failed')
    except:
        pass
outfile = open(sys.argv[2], "w")
for line in my_parser.metadata.print_header():
    outfile.write(line + '\n')
for variant in remaining:
    outfile.write('\t'.join([variant[head] for head in my_parser.header])+ "\n")
