input_pic="/search/odin/sxf/data/action/train_img/*"
output_pic="/search/odin/sxf/data/action/train_densepose/"

#input_pic="/search/odin/sxf/data/action/test_img/*"
#output_pic="/search/odin/sxf/data/action/test_densepose/"

for i in $input_pic
do
    input=$i
    output=${i/img/densepose}
    echo "process "$input" save in "$output
    
    nvidia-docker run -v /search/odin/sxf/DensePose/DensePoseData:/denseposedata -v $input:/input -v $output/:/output -it densepose sh -c "python2 tools/infer_simple.py --cfg configs/DensePose_ResNet101_FPN_s1x-e2e.yaml --output-dir /output/ --image-ext jpg --wts https://dl.fbaipublicfiles.com/densepose/DensePose_ResNet101_FPN_s1x-e2e.pkl /input/"
done

