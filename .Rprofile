# ~/.Rprofile

.First <- function() {
  options(
    repos                  = c(CRAN = "https://cran.rstudio.com/"),
    # Print no more than this many lines
    max.print              = 1000,
    # Ignore newlines when browsing with browse()
    browserNLdisabled      = TRUE,
    # Give minimal output from traceback()
    deparse.max.lines      = 2,
    # Options for job scheduling, only for LSF on Partners servers
    clustermq.scheduler    = "lsf",
    clustermq.template.lsf = "/PHShome/ks38/clustermq.template.lsf",
    # stringsAsFactors     = FALSE,
    menu.graphics          = FALSE
    # Print warnings about partial matching of object attributes
    # warnPartialMatchAttr   = TRUE,
    # warnPartialMatchDollar = TRUE
  )
  # Make the home directory the first path.
  # message("reversing libpaths")
  # .libPaths(rev(.libPaths()))
}

# Check if this is an interactive R session.
if (interactive()) {
  # Color the errors, warnings, and other text.
  require(colorout)
  # Automatically load devtools.
  suppressMessages(require(devtools))
} else {
  # Show some traceback information when non-interactive scripts fail.
  options(error = function() {
    traceback(2, max.lines = 10)
    quit(save = "no", status = 1)
  })
}

# Easily load the biocLite.R script
bioconductor <- function() {
  source("https://bioconductor.org/biocLite.R")
}

