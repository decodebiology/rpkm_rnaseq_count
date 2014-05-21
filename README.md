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




Author: Santhilal Subhash
Contact: santhilal.subhash@gu.se

