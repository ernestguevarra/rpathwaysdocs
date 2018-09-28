################################################################################
#
# Load libraries to use for data extraction from PDF documents
#
################################################################################

library(pdftools)
library(tabulizer)
library(tm)
library(stringr)
library(tidytext)
library(dplyr)



x <- pdf_text(pdf = "data-raw/docs/Roberts, Khattri - 2012 - Designing a results framework for achieving results a how-to guide.pdf")
x <- str_split(x, pattern = "\n")

################################################################################
#
# Remove unneeded pages
#
################################################################################
#
# Remove page 1
#
x[1] <- NULL
#
# Remove page 2
#
x[1] <- NULL
#
# Remove page 4
#
x[2] <- NULL
#
# Remove page 5
#
x[2] <- NULL
#
# Remove page 6
#
x[2] <- NULL


world_bank_results_framework_2012 <- NULL

for(i in 1:length(x)) {
  temp <- x[[i]]
  temp <- temp[2:length(temp)]
  world_bank_results_framework_2012 <- c(world_bank_results_framework_2012, temp)
}

world_bank_results_framework_2012 <- data_frame(linenumber = 1:length(world_bank_results_framework_2012),
                                                text = world_bank_results_framework_2012)

devtools::use_data(world_bank_results_framework_2012, overwrite = TRUE)
