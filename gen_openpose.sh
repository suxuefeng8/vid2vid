input_pic="/search/odin/sxf/data/action/train_img/*"
output_pic="/search/odin/sxf/data/action/train_openpose/"

#input_pic="/search/odin/sxf/data/action/test_img/*"
#output_pic="/search/odin/sxf/data/action/test_openpose/"

for i in $input_pic
do
    input=$i
    output=${i/img/openpose}
    echo "process "$input" save in "$output

    docker run -it -v $input:/input/ -v $output:/output/ --net=host -e DISPLAY --runtime=nvidia exsidius/openpose sh -c "./build/examples/openpose/openpose.bin --image_dir /input --display 0 --write_json /output --render_pose 0 --face --hand"
#    docker run -it -v $input:/input/ -v $output:/output/ --net=host -e DISPLAY --runtime=nvidia exsidius/openpose sh -c "./build/examples/openpose/openpose.bin --image_dir /input --display 0 --write_json /output --write_images /output --face --hand"
done

