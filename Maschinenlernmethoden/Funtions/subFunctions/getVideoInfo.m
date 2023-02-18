function [subfilename,video,numOfFrame] = getVideoInfo(filename)
    subfilename = filename(1:end-4);
    %读取视频
    video = VideoReader(filename);
    %获取视频帧数
    numOfFrame = video.NumberOfFrame;
end