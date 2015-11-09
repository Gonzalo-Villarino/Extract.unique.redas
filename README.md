# unique.redas
 ls ../01_tophat| sed -r 's/tophat_//' | awk '{print "samtools view /home3/gonzalo/Colombo/01_tophat/tophat_"$1"/accepted_hits.bam |grep -w \"'NH:i:1'\" -> /home3/gonzalo/Colombo/01_tophat/tophat_"$1"/"$1"_accepted_hits_unique.sam   \n  " }'
