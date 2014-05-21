#!/usr/bin/perl
#use strict;
#use warnings;
#Author: Santhilal Subhash
#Contact: santhilal.subhash@gu.se
#RPKM for RNAseq V1.2
#USAGE for sample input provided: perl rpkm_script_beta.pl sample_count_test.count 2:9 15 > sample_count_test.rpkm
#USAGE: perl rpkm_script_beta.pl input_count_file.txt ActualColumnStart:ActualColumnEnd ColumnGeneLength > results.rpkm
open $fh1, '<', $ARGV[0] or die $!;
open $fh2, '<', $ARGV[0] or die $!;
$total = 0;
$count = 0;
$cols=$ARGV[1];
$len_col=$ARGV[2];
while (<$fh1>) 
{
	@array=split("\t");
	($cstart,$cend)=split(":",$cols);
	for($i=$cstart-1;$i<=$cend-1;$i++)
	{
		$libarray[$i] += $array[$i];
	}
}

while (<$fh2>) 
{
	$next = <>;
	if ($next =~ /^#/) 
	{
		$header=$next;
		$header =~ s/#//;
		print "$header";
	}
	if ($next !~ /^#/) 
	{

 		@array=split("\t");
  		($cstart,$cend)=split(":",$cols);
  		for($i=$cstart-1;$i<=$cend-1;$i++)

		{
			if($array[$i]!=0)
			{
				$array_rpkm[$i]=((1000000000*$array[$i])/($libarray[$i]*$array[$len_col-1]));
			}
			else
			{
				$array_rpkm[$i]=0;
			}
		}
			local $" = "\t";
				
		print "$array[$cstart-2]@array_rpkm\t@array[$cend..$#array]";
	}
}


