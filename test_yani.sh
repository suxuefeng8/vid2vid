
set -eux 
python test.py --name edge2face_512 --dataroot datasets/face/ --dataset_mode face  --input_nc 15 --loadSize 512 --use_real_img 

real_in="datasets/face/test_img/001/"
fake_in="results/edge2face_512/test_latest/001/"

rm -f fake.mp4
#rm -f real.mp4 fake.mp4

#ffmpeg -start_number 8000 -i "$real_in/%05d.jpg" -c:v libx264 -vf "fps=25,format=yuv420p" real.mp4
ffmpeg -start_number 8000 -i "$fake_in/fake_B_%05d.jpg" -c:v libx264 -vf "fps=25,format=yuv420p" fake.mp4

