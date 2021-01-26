# java -jar /home/nfs_data/exome_project/ChromHMM/ChromHMM.jar NeighborhoodEnrichment 
# -posterior /home/nfs_data/exome_project/ChIP-seq/output/chrom_hd/POSTERIOR/ /home/nfs_data/exome_project/ChromHMM/ANCHORFILES/mm10/RefSeqTSS.mm10.txt.gz temp2 -binres
# java -jar /home/nfs_data/exome_project/ChromHMM/ChromHMM.jar OverlapEnrichment 
# /home/nfs_data/exome_project/ChIP-seq/output/chrom_hd/col2_18_segments.bed 
# /home/nfs_data/exome_project/ChromHMM/COORDS/mm10/RefSeqTSS.mm10.txt.gz 
# temp2 -binres -posterior /home/nfs_data/exome_project/ChIP-seq/output/chrom_hd/




runChromHmmLoop <- function(in.dir, out.dir, chrom.dir,
                            min.nr.states = 2, 
                            max.nr.states = 35, 
                            by.states = 3,
                            max.iterations = 1000, 
                            cores) {
  for(nr.states in seq(from = min.nr.states, to = max.nr.states, by = by.states)) {
    cmd <- paste("java -jar", chrom.dir, "LearnModel -p", cores, 
                 "-holdcolumnorder -r", max.iterations, 
                 "-nobrowser -noenrich -printstatebyline ", 
                 in.dir, out.dir, nr.states, "mm10", sep = ' ')
    system(command = cmd)
  }
}



# runChromHmmLoop(in.dir = "~/Chrom/output/chromhmm/",
#                 out.dir = "~/Chrom/output/chromhmm/",
#                 chrom.dir = "~/Chrom/input/ChromHMM/ChromHMM.jar",
#                 min.nr.states = 5,
#                 max.nr.states = 32,
#                 by.states = 2,
#                 max.iterations = 500,
#                 cores = 20)


# runChromHmmLoop(in.dir = "~/Chrom/output/chromhmm_permutations/chromhmm/P1/",
#                 out.dir = "~/Chrom/output/chromhmm_permutations/chromhmm/P1/",
#                 chrom.dir = "~/Chrom/input/ChromHMM/ChromHMM.jar",
#                 min.nr.states = 15,
#                 max.nr.states = 15,
#                 by.states = 1,
#                 max.iterations = 500,
#                 cores = 20)


# runChromHmmLoop(in.dir = "~/Chrom/output/chromhmm_permutations/chromhmm/P2/",
#                 out.dir = "~/Chrom/output/chromhmm_permutations/chromhmm/P2/",
#                 chrom.dir = "~/Chrom/input/ChromHMM/ChromHMM.jar",
#                 min.nr.states = 15,
#                 max.nr.states = 15,
#                 by.states = 1,
#                 max.iterations = 500,
#                 cores = 20)


# runChromHmmLoop(in.dir = "~/Chrom/output/chromhmm_permutations/chromhmm/P3/",
#                 out.dir = "~/Chrom/output/chromhmm_permutations/chromhmm/P3/",
#                 chrom.dir = "~/Chrom/input/ChromHMM/ChromHMM.jar",
#                 min.nr.states = 15,
#                 max.nr.states = 15,
#                 by.states = 1,
#                 max.iterations = 500,
#                 cores = 20)


# runChromHmmLoop(in.dir = "~/Chrom/output/chromhmm_limb_brain/",
#                 out.dir = "~/Chrom/output/chromhmm_limb_brain/",
#                 chrom.dir = "~/Chrom/input/ChromHMM/ChromHMM.jar",
#                 min.nr.states = 15,
#                 max.nr.states = 15,
#                 by.states = 1,
#                 max.iterations = 500,
#                 cores = 20)

