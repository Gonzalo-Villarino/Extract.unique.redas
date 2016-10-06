use strict;
use warnings;

open(FILE,"/home/ghv2/project/RNAseq/01_tophat/file.names.txt") or die;
while(<FILE>){
        chomp;
        my $name = $_;
        $name =~ s/tophat_//;
        open(OUT,">$name.pbs") or die;
        print OUT "#!/bin/bash\n";
	print OUT "#PBS -m abe -M gonzalo.villarino\@yale.edu\n";
	print OUT "#PBS -lnodes=1:ppn=20\n\n"; 
	
	print OUT "cd \$PBS_O_WORKDIR\n\n";

	print OUT "module load Apps/SAMtools/1.3\n";
        print OUT "samtools view /home/ghv2/project/RNAseq/01_tophat/tophat_$name/accepted_hits.bam |grep -w \"NH:i:1\" ->/home/ghv2/project/RNAseq/01_tophat/tophat_$name/$name\_unique.sam";
        print $name;
        close OUT;
} 
close FILE;
