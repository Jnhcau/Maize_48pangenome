#!/bin/sh
busco -i ${sample}.fa -c 20 -o ${sample}_genome_busco -m geno -l embryophyta_odb12 --offline
