#PBS TAGS
#!/bin/csh
#PBS -q hotel
#PBS -N tf_binding.sh
#PBS -l nodes=10:ppn=2
#PBS -l walltime=0:50:00
#PBS -o output.sh
#PBS -e error.txt
#PBS -V
#PBS -M e1luo@ucsd.edu
#PBS -m abe
#PBS -A e1luo

cat tf.bed | awk '{if($4 =="NFKB") print}' > tf.nfkb.bed
awk -F "\t" '{if($3 == "transcript") {print $0}}' gencode.v19.annotation.chr22.gtf > gencode.v19.annotation.chr22.transcript.gtf 
#EXERCISE3 (include loading of biotools)
bedtools intersect -a gencode.v19.annotation.chr22.transcript.promoter.gtf -b tf.nfkb.bed > gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf
bedtools getfasta -fi GRCh37.p13.chr22.fa -bed gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf -fo gencode.v19.annotation.chr22.transcript.promoter.nfkb.fasta
#EXERCISE6


echo "Hello I am a message in standard out (stdout)" 



