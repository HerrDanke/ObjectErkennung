function [subfilename,video,numOfFrame] = getVideoInfo(filename)
    %去除'.avi'
    subfilename = filename(1:end-4);
    %读取视频
    video = VideoReader(filename);
    %获取视频帧数
    numOfFrame = video.NumberOfFrame;
end