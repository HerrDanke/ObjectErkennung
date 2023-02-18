function getNewVideo(filenames,w,h,gamma)
    for i = 1:length(filenames)
        videoProcess(char(filenames(i)),w,h,gamma);
    end
end