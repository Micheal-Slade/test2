# dev-init.R
# Ensure 'pak' is installed
install.packages("pak", repos = "https://r-lib.github.io/p/pak/stable/")

# Create or update a package lockfile
pak::lockfile_create(
    pkg = c(
        "r2d3", "dotenv", "here", "lubridate",
        "tibble", "stringr", "readxl", "janitor",
        "openxlsx", "crew", "fs", "dplyr", "sf",
        "languageserver", "tidyr", "qs", "openair",
        "usethis", "readr", "lintr", "archive",
        "jsonlite", "checkmate", "targets",
        "tarchetypes", "glue"
    ),
    lockfile = "pkg.lock",
    upgrade = FALSE,
    dependencies = TRUE # Include dependencies
)
