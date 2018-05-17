#Commands used for differential expression analysis of the data using DESeq2
library("DESeq2")
directory <- ('/home/lovilund/ga/htseq')
sampleFiles <- grep("_",list.files(directory),value=TRUE)
sampleCondition <- c("cont", "cont", "cont", "mine", "mine")
sampleTable <- data.frame(sampleName=sampleFiles, fileName=sampleFiles, condition=sampleCondition)
ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable=sampleTable, directory=directory, design=~ condition)
keep <- rowSums(counts(ddsHTSeq)) > 0
ddsHTSeq <- ddsHTSeq[keep,]
ddsHTSeq$condition <- factor(ddsHTSeq$condition, levels = c("cont", "mine"))
ddsHTSeq <- DESeq(ddsHTSeq)
res <- results(ddsHTSeq)

#Getting the most significant genes
test <- subset(res, padj <0.05)
test[order(test$padj),]

#Heatmap
rld <- rlog( ddsHTSeq )
library( "genefilter" )
topVarGenes <- head( order( rowVars( assay(rld) ), decreasing=TRUE ), 35 )
heatmap.2( assay(rld)[ topVarGenes, ], scale="row",
           trace="none", dendrogram="column",
           col = colorRampPalette( rev(brewer.pal(9, "RdBu")) )(255))