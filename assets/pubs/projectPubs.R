# Script to take target bibtex, format it to markdown and append it to a given projects file

library(RefManageR)
library(knitr)

bibFile <- "assets/pubs/projectRefs/TGFRefs.bib"
projFile <- "_projects/2016-01-01-targetedGeneFlow.md"

#read data
bib_data <- ReadBib(bibFile)

# sort the bibliography
bib_data <-  sort(bib_data, sorting = "ynt", decreasing = TRUE)


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
  # remove annoying curly braces
  title <- gsub("\\{", "", bib.entry$title)
  title <- gsub("\\}", "", title)
  
  if (bib.entry$bibtype == "Article"){
    paste(auth.string,
          " (",
          bib.entry$year,
          ").  ",
          title,
          "  *",
          bib.entry$journal,
          "*. **",
          bib.entry$volume,
          "**: ",
          bib.entry$pages,
          ".",
          "\n\n ", 
          sep="")
  } else
  if (bib.entry$bibtype == "InCollection" || bib.entry$bibtype == "InProceedings"){
    eds <- lapply(bib.entry$editor, author)
    eds <- paste(unlist(eds), collapse = ", ")
    paste(auth.string,
          " (",
          bib.entry$year,
          ").  ",
          title,
          "  in ",
          eds,
          " *",
          bib.entry$book.title,
          "*. ",
          bib.entry$publisher,
          ". ",
          bib.entry$place,
          ".",
          "\n\n ",
          sep="")
  }
}


# format the bibliography
formatBib <- lapply(bib_data, bib2md)
formatBib <- unlist(formatBib)


write(c("## Selected publications \n\n", formatBib), file = projFile, append = TRUE)

#writeLines(formatBib, con = fc)


# for (pp in 1:length(formatBib)){
#   print(pp)
#   writeLines(formatBib[[pp]], con = fc)
# }


