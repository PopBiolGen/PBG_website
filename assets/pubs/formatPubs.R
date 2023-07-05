library(RefManageR)
library(knitr)

bib_data <- ReadBib("assets/pubs/PBG_pubs.bib")

# function to output markdown format
  # takes a single reference as argument
  # designed to be used with lapply
bib2md <- function(bib.entry){
  # to format the author list
  author <- function(author.entry){
    paste0(paste0(author.entry$family, collapse = " "), ", ", paste0(author.entry$given, collapse = ". "))
  }
  auth.string <- lapply(bib.entry$author, author)
  auth.string <- paste(unlist(auth.string), collapse = ", ")
  
  if (bib.entry$bibtype == "Article"){
    paste(auth.string,
          " (",
          bib.entry$year,
          ").  ",
          bib.entry$title,
          "  *",
          bib.entry$journal,
          "*. **",
          bib.entry$volume,
          "**:",
          bib.entry$pages,
          ".",
          "\n\n ", 
          sep="")
  }
}

# format the bibliography
formatBib <- lapply(bib_data, bib2md)
formatBib <- unlist(formatBib)

# open a file connection
fc <- file("_pages/publications.md")

writeLines(c("---
permalink: /publications/
title: Publications
author_profile: false
---\n\n", formatBib), fc)

#writeLines(formatBib, con = fc)


# for (pp in 1:length(formatBib)){
#   print(pp)
#   writeLines(formatBib[[pp]], con = fc)
# }

close(fc)

