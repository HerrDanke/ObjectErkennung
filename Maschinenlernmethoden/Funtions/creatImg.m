function creatImg()
    newVideoPath = 'newVideo\';
    video_filenames = getFileNames(newVideoPath,'avi');

    matPath = 'newMat\';
    mat_filenames = getFileNames(matPath,'mat');

    for i = 1:10
        [~,video,numOfFrame] = getVideoInfo(char(video_filenames(i)));    
        mat_subname = getSubname(char(mat_filenames(i)));
        rect = getVideoRect(i);
        
        mkdir("img\",mat_subname)

        for j = 1:numOfFrame
            flag = cellfun (@isempty, rect(j,:));
            if flag == 0
                frame = read(video,j);
                img_name = [mat_subname,'_',num2str(j),'.jpg'];
                imwrite(frame,strcat(['img\',mat_subname,'/'],img_name),'jpg');
            end
        end
    end
end