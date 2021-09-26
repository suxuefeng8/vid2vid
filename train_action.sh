python -u train.py --name pose2body_512p \
--dataroot datasets/pose --dataset_mode pose \
--input_nc 6 --n_scales_spatial 2 --num_D 3 \
--resize_or_crop randomScaleHeight_and_scaledCrop --loadSize 768 --fineSize 512 \
--gpu_ids 0,1,2,3 --batchSize 8 \
--no_first_img --n_frames_total 12 --max_t_step 4 --add_face_disc \
--niter_fix_global 3 --niter 5 --niter_decay 5 \
--lr 0.0001 >pose.log 2>&1 &
