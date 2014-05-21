RPKM_normalization
=================

RPKM for RNAseq V1.3

USAGE for sample input provided: perl rpkm_script_beta.pl sample_count_test.count 2:9 28 > sample_count_test.rpkm

USAGE: perl rpkm_script_beta.pl input_count_file.txt ActualColumnStart:ActualColumnEnd ColumnGeneLength > results.rpkm

ActualColumnStart = For example you have GeneID in first column and counts starts from second column. This should be '2'

ActualColumnEnd = Upto which column you need RPKM

ColumnGeneLength = Length of each gene (**NOTE below)






**NOTE: Steps to prepare your input
===================================

1) Length of the gene can be obtained from Gencode GTF by following command (Successfully tested upto Gencode V19):

cat gencode.vXX.annotation.gtf | awk -F'\t' '{if($3=="gene") {split($9,a,";"); print a[1]"\t"$5-$4};}' | sed 's/[gene_id |"|]//g' > geneWithLength.txt


2) join -j1  <(sort YOUR_COUNT_FILE) <(sort YOUR_GENE_LENGTH_FILE) > OUTPUT_ANNOTATED_COUNT_FILE


3) perl rpkm_script_beta.pl OUTPUT_ANNOTATED_COUNT_FILE ActualColumnStart:ActualColumnEnd ColumnGeneLength

Description: 
------------
ActualColumnStart = For example you have GeneID in first column and counts starts from second column. This should be '2'

ActualColumnEnd = Upto which column you need RPKM

ColumnGeneLength = Length of each gene




RPKM calculation:
================

RPKM = (10^9 * C)/(N * L), where

C = Number of reads mapped to a gene

N = Total mapped reads in the experiment

L = gene length in base-pairs for a gene


Author: Santhilal Subhash

Contact: santhilal.subhash@gu.se

