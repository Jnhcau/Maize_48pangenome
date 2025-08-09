#!/bin/bash
# Protein-coding gene filtering, longest isoform extraction, CDS and protein sequence generation, and format conversion

gff="path/to/sample.gff3"
genome="path/to/genome.fa"

# Filter protein-coding genes
agat_sp_filter_feature_by_attribute_value.pl --gff $gff --attribute biotype --value protein_coding -t '!' -o sample.protein_coding.gff3

# Extract longest isoform
agat_sp_keep_longest_isoform.pl --gff sample.protein_coding.gff3 -o sample.longest_isoform.gff3

# Extract CDS sequences
transdecoder/util/gff3_file_to_proteins.pl --gff3 sample.longest_isoform.gff3 --fasta $genome --seqType CDS > sample.cds.fa

# Extract protein sequences
transdecoder/util/gff3_file_to_proteins.pl --gff3 sample.longest_isoform.gff3 --fasta $genome --seqType prot > sample.pep.fa

# Convert CDS to OrthoFinder format (length ≥150 bp)
perl get_gene_longest_fa_for_OrthoFinder.pl -l 150 --gff sample.longest_isoform.gff3 --fa sample.cds.fa -p sample -o cds

# Convert protein sequences to OrthoFinder format (length ≥50 aa)
perl get_gene_longest_fa_for_OrthoFinder.pl -l 50 --gff sample.longest_isoform.gff3 --fa sample.pep.fa -p sample -o pep
