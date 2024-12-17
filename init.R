# init.R for Docker

# Set CRAN repository
options(repos = c(CRAN = "https://cran.r-project.org"))

# Install pak package manager if not already installed
if (!requireNamespace("pak", quietly = TRUE)) {
    install.packages("pak", repos = "https://r-lib.github.io/p/pak/stable/")
}

# Install R packages based on lockfile
pak::lockfile_install(lockfile = "pkg.lock")
