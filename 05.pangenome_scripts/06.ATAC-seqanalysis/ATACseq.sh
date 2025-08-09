bowtie2 -p 5 -x bowtie2_index -1 sample_R1.clean.fastq.gz -2 sample_R2.clean.fastq.gz | samtools sort -@ 5 -O bam -o sample.sorted.bam
picard MarkDuplicates REMOVE_DUPLICATES=true I=${bam_file} O=${dedup_bam} M=${metrics_file} && samtools index ${dedup_bam}
macs2 callpeak -t sample.dedup.bam -f BAM -g 2.18e9 -n sample --outdir macs2_out --keep-dup all -q 0.05 --nomodel --extsize 90
sort -k8,8nr sample_peaks.narrowPeak > sample_peaks_sorted.narrowPeak
idr --samples sample_Rep1_sorted_peaks.narrowPeak sample_Rep2_sorted_peaks_sorted.narrowPeak \
    --input-file-type narrowPeak \
    --rank p.value \
    --output-file sample-idr \
    --plot \
    --log-output-file sample.idr.log
    
