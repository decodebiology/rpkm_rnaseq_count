Update 2020/10/24: You can also use simplified and faster version of normalization script from <a href="https://gist.github.com/decodebiology/e5b9b0d9f4d0b3288338998676122f91">here</a>.


<h1><u>RPKM_normalization</u></h1>


RPKM for RNAseq V1.3

<b><u>Usage for sample input provided:</u></b> <br><pre><i>perl rpkm_script_beta.pl sample_count_test.count 2:9 28 > sample_count_test.rpkm</i></pre>

<b>Description<b>
<p>In above example 'sample_count_test.count' file has count data from 2 to 9th column;<br> 28th column has length of each genes calculated from Gencode GTF (Note below).</p>

<b><u>General usage:</u></b> <br><pre><i>perl rpkm_script_beta.pl input_count_file.txt ActualColumnStart:ActualColumnEnd ColumnGeneLength > OUTPUT_RPKM_FILE </i></pre>


<i>ActualColumnStart</i> = For example you have GeneID in first column and counts starts from second column. This should be '2'

<i>ActualColumnEnd</i> = Upto which column you need RPKM

<i>ColumnGeneLength</i> = Length of each gene (**NOTE below)





<h4><u>**NOTE: Steps to prepare your input</u></h4>

<ol>
<li>Length of the gene can be obtained from Gencode GTF by following command (Successfully tested upto Gencode V19)</li>

<pre><i>cat gencode.vXX.annotation.gtf | awk -F'\t' '{if($3=="gene") {split($9,a,";"); print a[1]"\t"$5-$4};}' | sed 's/[gene_id |"|]//g' &gt; YOUR_GENE_LENGTH_FILE<i></pre>


<li>Combine input_count_file.txt and YOUR_GENE_LENGTH_FILE by GeneID or First column</li>

<pre><i>join -j1  &lt;(sort input_count_file.txt) &lt;(sort YOUR_GENE_LENGTH_FILE) &gt; OUTPUT_ANNOTATED_COUNT_FILE</i></pre>

<li>Run the script over OUTPUT_ANNOTATED_COUNT_FILE</li>

<pre><i>perl rpkm_script_beta.pl OUTPUT_ANNOTATED_COUNT_FILE ActualColumnStart:ActualColumnEnd ColumnGeneLength &gt; OUTPUT_ANNOTATED_RPKM_FILE</i></pre>

</ol>

<b>Description</b>

<i>ActualColumnStart</i> = For example you have GeneID in first column and counts starts from second column. This should be '2'

<i>ActualColumnEnd</i> = Upto which column you need RPKM

<i>ColumnGeneLength</i> = Length of each gene




<h4><u>RPKM calculation</u></h4>


RPKM = (10^6 * C)/(N * L), where

C = Number of reads mapped to a gene

N = Total mapped reads in the experiment

L = gene length in base-pairs for a gene


Author: Santhilal Subhash


