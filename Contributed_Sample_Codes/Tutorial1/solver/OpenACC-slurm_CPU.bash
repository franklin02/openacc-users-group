#!/bin/bash

#SBATCH -J OpenACC_CPU          # Job name
#SBATCH -o log_anm.o%j      # Output and error file name (%j expands to jobID)
#SBATCH -N 1                # Number of nodes requested
#SBATCH -n 8               # Number of tasks (CPU cores)
#SBATCH -p bsudfq           # Queue (partition) -- this is Borah, ipowerq, eduq, gpuq.
#SBATCH -t 1:00:00      # Run time (hh:mm:ss) - 30 days, 10 hours

# Load necessary modules
module purge
module load slurm
module load gcc/10.2.0

export OMP_NUM_THREADS=48

# Define the output and error file names
OUTPUT_FILE="output.data"
ERROR_FILE="jsolvec_error_${SLURM_JOB_ID}.log"

# Execute the program and redirect stdout to output.data and stderr to the error log file
/bsuhome/ylu/scratch/OpenACC_coding/Tutorial1/solver/jsolvec.exe > $OUTPUT_FILE 2> $ERROR_FILE

# Exit if program errored:
status=$?
if [ $status -ne 0 ]; then
    exit $status
fi

# Do some post processing if needed.