hisat2 --new-summary -p 10 -x genome -1 read1.fq.gz -2 read2.fq.gz -S sample.sam && samtools view -bS sample.sam | samtools sort -o sample.bam
Rscript run-featurecounts.R -b {sample.bam} -g {genome.gtf} -o {sample.count}
