#!/usr/bin/env Rscript

# Only delete if _targets directory exists
if (dir.exists("_targets")) {
  message("Found existing _targets directory. Cleaning up...")
  targets::tar_delete(everything())
} else {
  message("No existing _targets directory found. Proceeding with pipeline...")
}

# Run the pipeline
targets::tar_make()