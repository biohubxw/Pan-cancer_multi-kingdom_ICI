for i in `cat file|cut -f1`;
do       
kraken2 --db /data/annotation/Fungi_db  --paired contaminate_out/${i}_kneaddata_paired_2.fastq  contaminate_out/${i}_kneaddata_paired_1.fastq \
        --threads 8 --use-names --report-zero-counts  \
        --report /data/temp/${i}.report   \
        --output /data/temp/${i}.output 
done
