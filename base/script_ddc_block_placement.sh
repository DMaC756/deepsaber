#!/bin/bash

#export PYTHONPATH="/home_directory/.local/lib/python3.5/site-packages/"

py=/usr/bin/python3
#py=/media/usr/bin/python3
dataset=general_beat_saber
model=ddc
layers=7
blocks=3
exp=block_placement_new_nohumreg
num_windows=10

$py train.py --data_dir=../DataSample --dataset_name=$dataset --model=$model --batch_size=1 --output_length=100 --num_windows=$num_windows --nepoch=500 --nepoch_decay=500 --layers=$layers --blocks=$blocks \
    --print_freq=10 --experiment_name=$exp --save_by_iter --save_latest_freq=10000 \
    --time_shifts=15\
    --time_offset=0\
    --val_epoch_freq=0 \
    --humaneness_reg_coeff=0.0 \
    --feature_name=multi_mel \
    --feature_size=80 \
    --input_channels=$((80+4)) \
    --num_classes=$((1+4)) \
    --workers=0 \
    --level_diff=Expert \
    --reduced_state \
    --binarized \
    --gpu_ids=0 \
    # --continue_train \
    # --load_iter=930000 \
    #--dilation_channels=512 \
    #--residual_channels=256 \
    #--skip_channels=256 \
    #--end_channels=512 \
    #--load \
    # --gpu_ids=0,1,2,3,4,5,6,7 \
