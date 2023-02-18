%Choose a video
[filename, ~] = selectVideo();
[~,video,numOfFrame] = getVideoInfo(filename);

background = zeros(video.Height, video.Width, 3);
numFrames = 2;

for i = 1:numFrames
    frame = readFrame(video);
    background = background + double(frame) / numFrames;
end
background = uint8(background);
frame = read(video,numFrames+1);

for i = numFrames+2:numOfFrame
    preFrame = frame;
    frame = read(video,i);
    
    [props_pre,~] = getProps(preFrame,background);
    [props,im] = getProps(frame,background);
    
    % Draw a rectangle around each connected component
    im_rect = im;
    rect = getMaxRect(props);
    frame = insertShape(frame, 'Rectangle', rect, 'LineWidth', 5);
    rect_pre = getMaxRect(props_pre);
    
    if ~isempty(rect_pre) && ~isempty(rect)
        dist = (rect_pre(1)-rect(1))^2+(rect_pre(2)-rect(2))^2;
        scale = 167/((rect_pre(3)+rect(3))/2);
        S = dist^0.5*scale;
        t =1/5400;
        v = (S/1000)/t;
        text = sprintf('speed is %f m/s',v);
        position = [100 200];
        im_rect = insertText(im_rect,position,text,'FontSize',30,'TextColor','red');
    end
   
    % Display the original frame and the binary mask
    imshowpair(frame, im_rect, 'montage');
    
    % Pause to allow the images to be displayed
    pause(4/video.FrameRate);
end