#!/bin/sh
nucmer --mum -c 90 -l 40 -t 20 -p $query ref.fa  $query.fa
delta-filter -1 -r -q $query.delta > $query.1delta
show-coords -Tclrd  $query.1delta > $query.1coords

delta-filter -m -r -q -i 90 -l 100 $query.delta > $query.mdelta
show-coords -Tclrd  $query.mdelta > $query.mcoords