function videoProcess(filename,w,h,gamma)
    [subfilename,video,numOfFrame] = getVideoInfo(filename);
    %创建新视频的名字
    newfilename = ['newVideo\',subfilename,'_new','.avi'];
    % 创建输出视频对象
    vw = VideoWriter(newfilename);
    % 打开输出视频对象
    open(vw);
    
    for i = 1:numOfFrame
        %读取视频帧
        frame = readFrame(video);
        %调整gamma值
        frame = imadjust(frame, [], [], gamma);
        %调整图片大小
        frame = imresize(frame, [w,h]);
    
        %将彩色图转换成灰度图
        s = size(frame);
        if length(s) == 3
            frame = rgb2gray(frame);
        end
    
        % 将调整后的视频帧写入输出视频
        writeVideo(vw, frame);
    
%         imshow(frame);
%         pause(1/video.FrameRate);
    end
    
    % 关闭输出视频对象
    close(vw);
end