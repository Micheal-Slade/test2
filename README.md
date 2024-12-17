# R with Docker Template

# README for Developers

This is a template Repository for quick setup for R {targets} Pipelines in a docker container. Instructions on how the pipeline is designed to be run can be found below. It's encouraged that you keep these in your README.md file in order to provide users with a step by step of how to get the pipeline running on their system.

## Setup instructions
Choose the appropriate Dockerfile based on your needs:

```plaintext
docker/
├── base/
│   └── Dockerfile
└── spatial/
    └── Dockerfile
```

For basic data processing:
```bash
cp docker/base/Dockerfile ./Dockerfile
```
For spatial data processing (includes sf package dependencies):
```bash
cp docker/spatial/Dockerfile ./Dockerfile
```

# README for End Users

## Prerequisites

Before we begin, you'll need:
- Docker installed on your machine
- Git installed on your machine
- A completed `.env` file (use the `env.example` as your template)

## Getting Started

1. First, clone this repository to your local machine:
   ```bash
   git clone https://github.com/Greater-London-Authority/llo-production-pipeline
   cd llo-production-pipeline
   ```

2. Build the Docker image. This step will set up all the required R packages and dependencies:
   ```bash
   docker build -t llo-targets-pipeline .
   ```

   This build process might take a few minutes, as it's:
   - Setting up the R environment
   - Installing all necessary system dependencies
   - Installing our required R packages using version-controlled lockfiles

3. Once the build is complete, you can run the pipeline:
   ```bash
   docker run -v $(pwd):/pipeline llo-targets-pipeline
   ```

## What's Happening?

When you run the pipeline, Docker:
- Mounts your current directory into the container
- Executes the pipeline scripts
- Outputs results back to your local machine

## Troubleshooting

If you encounter any issues:
1. Ensure Docker is running on your machine
2. Check you have sufficient disk space
3. If you get permission errors, ensure your files have the correct permissions:
   ```bash
   chmod +x run.sh
   ```

## Need Help?

If you're stuck, please:
1. Check the existing issues on our repository
2. Create a new issue if you're experiencing a novel problem
3. Contact the maintainer at [someone@example.com]