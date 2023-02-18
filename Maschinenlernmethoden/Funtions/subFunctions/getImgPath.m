function [img_path] = getImgPath(num)

    newVideoPath = 'newVideo\';
    video_filenames = getFileNames(newVideoPath,'avi');

    matPath = 'newMat\';
    mat_filenames = getFileNames(matPath,'mat');

    [~,video,numOfFrame] = getVideoInfo(char(video_filenames(num)));    
    mat_subname = getSubname(char(mat_filenames(num)));
    rect = getVideoRect(num);

    img_path = [];
    for i = 1:numOfFrame
        flag = cellfun (@isempty, rect(i,:));
        if flag == 0
            frame = read(video,i);
            img_name = [mat_subname,'_',num2str(i),'.jpg'];
            path = ['C:\Users\47172\Documents\ObjectErkennung\Maschinenlernmethoden\img\',mat_subname,'\',img_name];
            path = string(path);
            img_path = [img_path;path];
        end
    end
end
