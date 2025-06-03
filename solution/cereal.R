## -------------------------------------------------------------------------------------------------------------------------------------
## a
df <- data.frame(cereal = strsplit("gggcttttgctgttgcttgtctgtt", "")[[1]],
                 like   = strsplit("clnnccclcnclclcdcllclcllc", "")[[1]],
                 gift   = strsplit("sssrsrsrrssrsrwrwrscrsrrr", "")[[1]],
                 gender = strsplit("mmmmffffmfffmmfmfffmfmfff", "")[[1]])
str(df)
head(df)
## b
library("tibble")
tb <- as_tibble(df)
head(tb)
## c
tab <- table(df$gender)
tab
prop.table(tab)
## d
table(df$cereal) # No mode computation in base R
## e
table(df$gift)

