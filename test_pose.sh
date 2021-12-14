set -eux 
#python test.py --name pose2body_256p --how_many 30000 --dataroot datasets/pose/ --dataset_mode pose  --input_nc 6 --loadSize 256 --use_real_img 


input="/search/odin/sxf/vid2vid/results/pose2body_256p/test_latest/*"
output="/search/odin/sxf/vid2vid/results/pose2body_256p/"

for i in $input
do
    if [ -d $i ]
    then
        echo "process $i" 
        cat ${i}/real_A_*.jpg | ffmpeg -y -f image2pipe -i - ${i}_real.mp4
        cat ${i}/fake_B_*.jpg | ffmpeg -y -f image2pipe -i - ${i}_fake.mp4
    fi
done
