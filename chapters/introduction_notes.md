# Notes on papers

grace hopper quotes: https://www.thoughtco.com/grace-hopper-quotes-3530092


## structure

theme: Bioinformatics for Everyone

1) Brief History of Genomics

2) Intro to sequencing
   - central dogma
   - sequencers and data

3) Bioinformatics challenges

4) Bioinformatics best practices/accessibility
 - pipelines, automation, reproducibility
 - visualisation, reporting
 - FAIR data
 - training

5) Use case 1: Prostate cancer

6) Use case 2: Microbiota


## Bioinformatics Challenge


Bioinformatics comes into play at various steps in the analysis process. The four main analysis tiers \cite{kulski2016next} to consider are 1) Base calling and quality scoring, typically done by software integrated into sequencing machines 2) Mapping and/or assembling of the short reads, and variant calling 3) Annotation, data integration, and visualisation, and 4) Aggregation of heterogeneous datasets into a coherent reference data source. Any errors or biases introduced in each of these steps can have a significant impact on downstream analyses and interpretation.

...


% skip this section I think, to nitty-gritty

% choice of tool
For each analysis task there will be a number of tools available to do the job, but discerning which best fits your needs can be a challenge. Each tool's publication usually includes a benchmark showing it outperforms all its competitors, and typically it does, but only under a set of highly-specific hand-picked conditions. While impartial review articles which compare and benchmark several related tools do exist \cite{lim2012review,hasan2015performance} [TODO:add more examples], the problem remains a multi-objective optimization problem, with no single tool performing better in all respects to its competitors. Which of these tools is most suitable usually depends largely on the exact experimental setup and research question. In practice however, the ease of installation and use of a tool also plays a significant role in the choice of software. A tool that is theoretically superior but difficult to install usually is abandoned for other, more usable alternatives, as evidenced by the citation statistics of easy-to-use tools as compared to their less user-friendly counterparts \cite{roberts2004new}.

% choice of reference data
Not only the choice of software, but also the choice of reference data can hugely impact analysis results and interpretation. In variant annotation for instance, two of the most widely used transcript set reference databases are RefSeq \cite{} and ENSEMBL \cite{}, however, choosing one or the other was found to lead to wildly different variant effect predictions, with concordance as low as 44\% for putative loss-of-function variants \cite{mccarthy2014choice}. Performing RNASeq and actually sequencing the transcripts instead of predicting will help to improve. [Choice of reference genome, impacts results, hard to compare across reference genomes]





## Large scale projects

COSMIC
TCGA
CGP
ICGC
TARGET
ENCODE

## From Human genome to cancer genome: the first decade

### timeline
(fig 1 has nice graphical timeline)

Sequencing human genome 1990-2003, time line: \url{http://web.ornl.gov/sci/techresources/Human_Genome/project/timeline.shtml}


1986: human reference genome project announced
1990-2003: human reference genome project

2004 cancer gene census: 291 genes associated with cancer in literature, 90% somatically mutated, 20% germline mutated, 10% a combination of both [Futreal 2004, A census of human cancer genes]


up til 2004, never sequence more than handful of genes in single patient

2004-2006 Roche454 and Illumina introduce massively parallel sequencers

2004-2013 focus on increasing patient cohort sizes with WES rather than moving to WGS

chin et al 2011: large-scale variations observed using WGS

2010-2012: projects started to systematically catalogue mutations: TCGA (the cancer genome atlas), cancer genome project (sanger, incl COSMIC), ICGC, TARGET (therapeuticaly aplicable reserch to generate effective treatments), ENCODE
(garraway and lander 2013 for tally of large projects)

2006 onwards: augment with cDNA sequencing (RNA seq) to explore alterations at transcriptome level (expression, alternative splicing, chimeric gene fusion transcripts, expressed somatic mutations)

chromatin modifications in cancer context in infancy (in 2013) but promising

2011: tumor evolution inferred by single cell sequencing

---
 describe some of the major developments over time and what that meant for cancer research in particular

    Sources / outline:
    - From Human genome to cancer genome: the first decade. [@wheeler2013human]
    - U.S. declaration of war on cancer 1971 \url{https://en.wikipedia.org/wiki/War_on_Cancer}
    - Sequencing human genome 1990-2003, time line: \url{http://web.ornl.gov/sci/techresources/Human_Genome/project/timeline.shtml}
    - WES – large scale [@wood2007genomic] → confirmed known oncogenes
    - WGS – large SVs
    - augment with cDNA sequencing (RNASeq) → gene expression, splicing, fusions, ..
    - augment with epigenetics (chromatin modification)

    - some cancers can be cured, but rarely after metastases
    - treatment vs prevention

---


### Mutation patterns

- 3 orders of magnitude difference across different tumour types
- 1 order of magnitude within a tumour type
- low-to-high: pediatric cancers, adult leukemia, adult solid tumours
- \> 10 coding mutations per Mbp: often deficient in mismatch repair, often mutation/epigenetic silencing of MLH1 (or other mismatch repair enzymes)
- \> 100 coding mutations per Mbp: mutated in exonuclease domane of POLE one of tho DNA replicative enzymes in the cell
- mutation rate in cancers can be predictor of outcome (colorectal cancer w high rates of mutation improved survival than patients with lower mutation rates [Walther 2009])
--> mutation patterns can be important for subclassifying disease and differing prognosis/treatment

- many pediatric cancers very few mutations so less useful in clinic

common pattern: 1-3 genes mutated >20% of patients, shoulder of several more genes at 10-20%, then long tail of lowly mutated genes.

The genes on the tail of the frequency distribution have great importance for the understanding of tumor biology. First, they may exhibit redundancy of mutation in a given signaling pathway in a single patient, which contributes to our understanding of how the pathway is utilized by the cancer cell. Second, weaker drivers have often revealed entirely new pathways or processes (examples in paper)

There are also important clinical implications for the low-frequency recurrent cancer genes. The tail of the mutation profile is often found to be populated with genes that are strong drivers in other cancers and for which therapies have already been designed or are in the pipeline (Taylor et al. 2012). This has given rise to the notion that it might be better to classify cancers based on mutation profile for developing treatment strategies rather than histopathology―a radical departure from well-established clinical standards

Many important new cancer genes, mutated in 20% or more of the patients with common cancers, were absent from the 2004 cancer gene census (Futreal et al. 2004). Among the genes emerging from large-scale studies, the most impressive advances have provided insights into the role of chromatin remodeling in tumorigenesis. Isocitrate dehydrogenase 1 and 2, IDH1 and IDH2, were surprising additions to the list of cancer drivers emerging from glioblastoma multiforme (GBM) among the first whole-exome screens reported (Parsons et al. 2008).

TP53: most frequently mutated gene in cancer

**WGS**
WGS sequencing is a generalized route to reliable discovery and interpretation of mutation in noncoding regions of the genome. This fact was driven home dramatically in the recent reports of somatic base substitution at one of only two positions in the promoter of TERT in over 70% of melanoma patients (Horn et al. 2013; Huang et al. 2013).

**chromothripsis/kaega**
Analysis of paired reads from WGS data led to the discovery of chromothripsis (Stephens et al. 2011), the result of a catastrophic shattering of one or more chromosomes followed by misjoining of the scrambled fragments upon repair, and kataegis, the localized bursts of point mutations often correlated with somatic structural variation. The mechanisms for neither of these processes is clearly understood, although it is interesting to note that chromothripsis-like events have been observed in normal human germline DNA, at translocation break points, and are associated with congenital deformities and mental retardation (Kloosterman et al. 2011; Chiang et al. 2012).
the association of extensive rearrangement with key tumor suppressors and oncogenes in some patients suggests that chromothripsis may sometimes mediate tumorigenesis and associates with clinical outcome (Magrangeas et al. 2011; Molenaar et al. 2012; Hirsch et al. 2013; Malhotra et al. 2013).

**single cell**
Genetically distinguishable subpopulations in a mixture of cancer cells were well demonstrated by single-nucleus and single-cell sequencing (Navin et al. 2011; Hou et al. 2012; Xu et al. 2012).  Intra-tumor heterogeneity has been suggested as a common feature in both solid tumors and hematological malignancies. The implications for clinical treatment of tumors are daunting since this suggests that genomic analysis from needle biopsies may yield a biased view of the genetic landscape of the tumor


## Hallmarks of cancer


\begin{itemize}
    \item self-sufficiency in growth signals
    \item insensitivity to anti-growth signals
    \item evasion of programmed cell death
    \item limitless replicative potential
    \item sustained angiogenesis
    \item tissue invasion and metastasis
\end{itemize}


## The Hallmarks of Cancer: The next generation
