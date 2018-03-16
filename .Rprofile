# ~/.Rprofile

options(
  repos                  = c(CRAN="https://cloud.r-project.org/"),
  max.print              = 1000,
  browserNLdisabled      = TRUE,
  deparse.max.lines      = 2,
  clustermq.scheduler    = "lsf",
  clustermq.template.lsf = "/PHShome/ks38/clustermq.template.lsf",
  # stringsAsFactors     = FALSE,
  menu.graphics          = FALSE,
  warnPartialMatchAttr   = TRUE,
  warnPartialMatchDollar = TRUE
)

bioconductor <- function() {
  source("http://bioconductor.org/biocLite.R")
}

if (interactive()) {
  # Show cool colors in interactive R sessions.
  library(colorout)
} else {
  # Show some traceback information when non-interactive scripts fail.
  options(error = function() {
    traceback(2, max.lines = 10)
    quit(save = "no", status = 1)
  })
}

# Make the home directory the first path.
# .First <- function() {
#   message("reversing libpaths")
#   .libPaths(rev(.libPaths()))
# }
