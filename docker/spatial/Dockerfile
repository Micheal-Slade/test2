# Use a specific Rocker version for stability
FROM rocker/r-ver:4.3.3

# Install system dependencies for R packages including spatial libraries and PostgreSQL
RUN apt-get update && apt-get install -y \
    build-essential \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libgdal-dev \
    libudunits2-dev \
    libgeos-dev \
    libproj-dev \
    libsqlite3-dev \
    sqlite3 \
    postgresql-client \
    libpq-dev \
    libpng-dev \
    libjpeg-dev \
    gdal-bin \
    pandoc \
    cmake \
    xz-utils \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set environment options for R
ENV R_PKG_REPOS="https://cran.r-project.org"

# Install pak package manager explicitly
RUN Rscript -e "install.packages('pak', repos = 'https://r-lib.github.io/p/pak/stable/')"

# Create and set the working directory
WORKDIR /pipeline

# Copy dev-init.R and generate the lockfile dynamically
COPY dev-init.R /pipeline/
RUN Rscript dev-init.R

# Copy init.R and install packages based on the lockfile
COPY init.R /pipeline/
RUN Rscript init.R

# Copy pipeline files into the container
COPY run.R /pipeline/
COPY run.sh /pipeline/

# Make run.sh executable
RUN chmod +x /pipeline/run.sh

# Set entrypoint to run.sh script
ENTRYPOINT ["/pipeline/run.sh"]
