#!/bin/sh
syri --nc 10  --nosnp --prefix $query. -c $query.mcoords.syri -d $query.mdelta -r ref.fa -q $query.ordered.qry.fasta
