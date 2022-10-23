library(tidyr)
library(stringr)

save_dir = "Assets/Boxplots/"

for (wine in c("Red", "White")) {
  if (wine == "Red") {
    data <- winequality_red
  } else {
    data <- winequality_white
  }
  for (col in colnames(data)) {
    if (col == "quality") {
      next
    }
    png(paste(save_dir, wine, "/", gsub(" ", "_", col), ".png", sep = ""))
    outliers <- boxplot(data[col], ylab = "Arbitrary Units", main = paste(str_to_title(col), "Data", sep = " "))$out
    data[data[col][[1]] %in% outliers, col] = NA
    dev.off()
  }
  data = drop_na(data)
  if (wine == "Red") {
    winequality_red <- data
  } else {
    winequality_white <- data
  }
}

remove(outliers)
remove(col)
remove(data)
remove(wine)
remove(save_dir)
