library("HiCseg")


# set the path to the folder "tutorial" that has been created by unpacking the archive At.zip and the path to the folder with the scripts (the folder where the R-files are located)
pathToData <- "../Data"
pathToScripts <- "../Rscripts"
pathToOutput <- "../Output"
# load all the necessary functions (general and organism specific)
library(HiCdatR)
f.source.organism.specific.code(file.path(pathToScripts, "organism-specific_R-code.R"))


# set the binSize : 6 x 10^8
binSize = 1e5 

# load all samples into a list, access an individual HiC matrix with binMatList[[sampleName]] or binMatList$sampleName
dataMatrix <- f.load.one.sample(
                    dataDir = pathToData,
                    files = c("62_3_2.txt","63_3_2.txt","64_3_2.txt","65_3_2.txt","66_3_2.txt","67_3_2.txt","68_3_2.txt"),
                    binSize = binSize,
                    repetitions = 50
)


#f.plot.XY.matrix(binMatList, binSize, 1e7, pathToTutorial, "HiC_raw_Col_combined")
# draw heatmaps of the raw interaction frequencies and the correlated interaction frequencies
f.plot.XY.matrix(
    matrixToPlot = dataMatrix,
    binSize = binSize,
    axStep = 1e7,
    rDir = pathToOutput,
    outfile = "HiC_raw_Col_combined"
)

f.identify.domains.with.HiCseg(dataMatrix, binSize, pathToOutput, outfilePrefix = "domains", minAverageDomainSize = 1e6, distributionType = "G", modelType = "Dplus", useLog = TRUE, regionDefinitionTable = data.frame())

