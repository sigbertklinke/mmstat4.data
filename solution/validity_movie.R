## -------------------------------------------------------------------------------------------------------------------------------------
x <- ghload("data/movies.rds")
# problems:
# YEAR - not in date format
table(YEAR)
# GENRE  
genre <- unlist(strsplit(x$GENRE, "[\\s\\,]"))
genre <- gsub("\\\n", "", genre, fixed=TRUE)
table(trimws(genre))
# RATING
as.numeric(x$RATING)
# VOTES
as.numeric(gsub(",", "", x$VOTES, fixed=TRUE))
# RunTime
as.numeric(x$RunTime)
# Gross
table(x$Gross)

