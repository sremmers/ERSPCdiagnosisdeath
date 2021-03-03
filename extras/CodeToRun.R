library(ERSPCdiagnosisdeath)
# USER INPUTS
#=======================
# The folder where the study intermediate and result files will be written:
outputFolder <- "./ERSPCdiagnosisdeathResults"

# Specify where the temporary files (used by the ff package) will be created:
options(fftempdir = "temp")

# Details for connecting to the server:
dbms <- "postgresql"
user <- ""
pw <- ""
server <- "postgresql/ohdsi"
port <- "5432"
connectionDetails <- DatabaseConnector::createConnectionDetails(dbms = dbms,
                                                                server = server,
                                                                user = user,
                                                                password = pw,
                                                                port = port)
# createCohorts(connectionDetails, outputFolder = outputFolder)

# Add the database containing the OMOP CDM data
cdmDatabaseSchema <- "erspc_results"
# Add a sharebale name for the database containing the OMOP CDM data
cdmDatabaseName <- "erspc"
# Add a database with read/write access as this is where the cohorts will be generated
cohortDatabaseSchema <- 'work database schema'

oracleTempSchema <- NULL

# table name where the cohorts will be generated
cohortTable <- 'ERSPCdiagnosisdeathCohort'
#=======================

execute(connectionDetails = connectionDetails,
        cdmDatabaseSchema = cdmDatabaseSchema,
        cdmDatabaseName = cdmDatabaseName,
        cohortDatabaseSchema = cohortDatabaseSchema,
        cohortTable = cohortTable,
        outputFolder = outputFolder,
        createProtocol = F,
        createCohorts = F,
        runAnalyses = F,
        createResultsDoc = F,
        packageResults = F,
        createValidationPackage = F, 
        minCellCount= 5,
        createShiny = T,
        createJournalDocument = F,
        analysisIdDocument = 1)

# if you ran execute with: createShiny = T
# Uncomment and run the next line to see the shiny app:
# viewShiny()
