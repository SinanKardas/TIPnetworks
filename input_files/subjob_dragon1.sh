#!/bin/bash
## Submission script for Dragon1
## Please uncomment the line by removing the '#' at the start of the line (to enable) or comment out the line by adding a '#' at the start of the line (to disable)
#SBATCH --mail-user=sinan.kardas@umons.ac.be
#SBATCH --mail-type=ALL
#SBATCH --job-name=job

#### FOR CPU TASKS (add only one '#' at the start of the line to enable)
#SBATCH --ntasks=2
#SBATCH --mem-per-cpu=1000 # memory(Mb)
#SBATCH --time=15:00:00 # hh:mm:ss
#####WORKDIR=/scratch/$SLURM_JOB_ID
#mkdir $WORKDIR
#cp $SLURM_SUBMIT_DIR/*.*  $WORKDIR
#cd $WORKDIR
#module load amber/16gpu
#mpirun sander.MPI -O -i prod_gb.in -o prod_01.out -p 20_BTA-core_35.prmtop -c 20_BTA-core_35_min.crd -r 20_BTA-core_35_prod_01.crd -x 20_BTA-core_35_prod_01.nc -e mden_01 -inf mdinfo_01

#### FOR GPU TASKS on the K20M (Kepler) : dr27/dr28 (max 15 days) (add only one '#' at the start of the line to enable)
#SBATCH --ntasks-per-core=1
#SBATCH --gres=gpu:kepler:1
#SBATCH --partition=gpu
#SBATCH --mem-per-cpu=4000
#SBATCH --time=144:00:00
#####WORKDIR=/scratch/$SLURM_JOB_ID
#mkdir $WORKDIR
#cp $SLURM_SUBMIT_DIR/*.*  $WORKDIR
#cd $WORKDIR
module load amber/16gpuk

pmemd.cuda -O -i prod_gb.in -o prod_01.out -p pTCIP1.prmtop -c pTCIP1_min.crd -r pTCIP1_prod_01.crd -x pTCIP1_prod_01.nc -ref pTCIP1_min.crd -e mden_01 -inf mdinfo_01

#### FOR GPU TASKS on the M2075 (Tesla) : dr25/dr26 (max 15 days) (add only one '#' at the start of the line to enable)
#SBATCH --ntasks-per-core=1
#SBATCH --gres=gpu:tesla:1
#SBATCH --partition=gpu
#SBATCH --mem-per-cpu=4000
#SBATCH --time=144:00:00
#####WORKDIR=/scratch/$SLURM_JOB_ID
#mkdir $WORKDIR
#cp $SLURM_SUBMIT_DIR/*.*  $WORKDIR
#cd $WORKDIR
#module load amber/16gpu

#pmemd.cuda -O -i prod_gb.in -o prod_01.out -p DoubleHelixSulfCTAB36_opt.prmtop -c DoubleHelixSulfCTAB36_opt_min2.crd -r DoubleHelixSulfCTAB36_opt_prod_01.crd -x DoubleHelixSulfCTAB36_opt_prod_01.nc -ref DoubleHelixSulfCTAB36_opt_min2.crd -e mden_01 -inf mdinfo_01

#### FOR GPU TASKS on lgpu (max 21 days) (add only one '#' at the start of the line to enable)
#SBATCH --ntasks-per-core=1
#SBATCH --gres=gpu:tesla:1
#SBATCH --partition=lgpu
#SBATCH --mem-per-cpu=4000
#SBATCH --time=144:00:00
#####WORKDIR=/scratch/$SLURM_JOB_ID
#mkdir $WORKDIR
#cp $SLURM_SUBMIT_DIR/*.*  $WORKDIR
#cd $WORKDIR
#module load amber/16gpu

#pmemd.cuda -O -i prod_gb.in -o prod_01.out -p DoubleHelixSulfCTAB36_opt.prmtop -c DoubleHelixSulfCTAB36_opt_min2.crd -r DoubleHelixSulfCTAB36_opt_prod_01.crd -x DoubleHelixSulfCTAB36_opt_prod_01.nc -ref DoubleHelixSulfCTAB36_opt_min2.crd -e mden_01 -inf mdinfo_01


