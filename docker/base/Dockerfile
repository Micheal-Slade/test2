# Use a specific Rocker version for R 4.3.3
FROM rocker/r-ver:4.3.3

# Install required system dependencies for R packages
RUN apt-get update && apt-get install -y \
    build-essential \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libgdal-dev \
    libudunits2-dev \
    gdal-bin \
    libgeos-dev \
    libproj-dev \
    libsqlite3-dev \
    libicu-dev \
    libjpeg-dev \
    libpng-dev \
    libgit2-dev \
    libarchive-dev \
    libglpk-dev \
    cmake \
    xz-utils \
    libx11-dev \
    git \
    pandoc \
    && rm -rf /var/lib/apt/lists/*

# Set environment options for R
ENV R_PKG_REPOS="https://cran.r-project.org"

# Install pak package manager explicitly
RUN Rscript -e "install.packages('pak', repos = 'https://r-lib.github.io/p/pak/stable/')"

# Create and set the working directory
WORKDIR /pipeline

# Copy dev-init.R into the image and generate the lockfile
COPY dev-init.R /pipeline/
RUN Rscript dev-init.R

# Copy init.R and install packages based on the lockfile
COPY init.R /pipeline/
RUN Rscript init.R

# Copy pipeline files
COPY run.R /pipeline/
COPY run.sh /pipeline/

# Make run.sh executable
RUN chmod +x /pipeline/run.sh

# Set entrypoint to run.sh script
ENTRYPOINT ["/pipeline/run.sh"]
