#!/bin/bash

#SBATCH -J ANM_GPU        # job name
#SBATCH -o log_anm.o%j  # output and error file name (%j expands to jobID)
#SBATCH -N 1              # number of nodes requested
#SBATCH -n 48           #--exclusive   # request exclusive usage of your nodes. (for low cpu, high memory jobs) 
#SBATCH -p gpu          # queue (partition) -- this is Borah, ipowerq, eduq, gpuq.
#SBATCH -t 20-24:00:00       # run time (hh:mm:ss) - 12.0 hours in this example.
#SBATCH --gres=gpu:1 

# Generally needed modules:
module purge
module load slurm
module load gcc/10.2.0
module load cuda11.0 

export OMP_NUM_THREADS=48
# Execute the program:
#anm Input
/bsuhome/ylu/Anm3.x/CUDA/AnmCuda_3.0.0_beta 
# Exit if program errored:
status=$?
if [ $status -ne 0 ]; then
    exit $status
fi

# Do some post processing if needed.


