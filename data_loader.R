library(readr)

data_dir <- "Dataset/"

winequality_red <- read_delim(paste(data_dir, "winequality-red.csv", sep = ""), delim = ";", escape_double = FALSE, trim_ws = TRUE)
winequality_white <- read_delim(paste(data_dir, "winequality-white.csv", sep = ""), delim = ";", escape_double = FALSE, trim_ws = TRUE)

remove(data_dir)