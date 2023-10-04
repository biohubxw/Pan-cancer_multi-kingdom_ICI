for i in `cat file |cut -f1`;
do
  kneaddata --paired seq/${i}_1.fastq.gz seq/${i}_2.fastq.gz \
            -o human_out/ -v -t 8  \
            --trimmomatic /data/trimmomatic-0.39-2/  \
            --trimmomatic-options  'SLIDINGWINDOW:4:20 MINLEN:50 LEADING:3 TRAILING:3'   \
            --reorder --bowtie2-options "--very-sensitive --dovetail" \
            -db /data/annotation/human_genome/ 
  kneaddata --paired human_out/${i}_1_kneaddata_paired_2.fastq human_out/${i}_1_kneaddata_paired_1.fastq \ 
            -o contaminate_out/ -v -t 8  \
            --reorder --bowtie2-options "--very-sensitive --dovetail"  \
            -db /data/annotation/contaminate_db/ --bypass-trim 
done

