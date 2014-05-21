RPKM_normalization
=================

RPKM for RNAseq V1.3

USAGE for sample input provided: perl rpkm_script_beta.pl sample_count_test.count 2:9 15 > sample_count_test.rpkm

USAGE: perl rpkm_script_beta.pl input_count_file.txt ActualColumnStart:ActualColumnEnd ColumnGeneLength > results.rpkm





RPKM calculation:


RPKM = (10^9 * C)/(N * L), where

C = Number of reads mapped to a gene

N = Total mapped reads in the experiment

L = gene length in base-pairs for a gene




**NOTE: Length of the gene can be obtained from Gencode GTF by following command (Successfully tested upto Gencode V19):

cat gencode.vXX.annotation.gtf | grep -P "\tgene\t" | awk -F'\t' '{split($9,a,";");print a[1]"\t"$5-$4}' | sed 's/[gene_id |"|]//g' > geneWithLength.txt




Author: Santhilal Subhash

Contact: santhilal.subhash@gu.se

