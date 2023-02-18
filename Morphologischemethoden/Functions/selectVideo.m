%选取视频文件
function [filename, pathname] = selectVideo()
    [filename, pathname] = uigetfile({'*.avi;*.mp4'}, 'Pick a video file');
    if isequal(filename,0) || isequal(pathname,0)
        disp('User selected Cancel');
    else
        fullpath = fullfile(pathname, filename);
        disp(['User selected ', fullpath]);
    end
end

