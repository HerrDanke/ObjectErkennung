model = load("detector.mat");

%Choose a video
[filename, ~] = getVideoName();
[~,video,numOfFrame] = getVideoInfo(filename);

 for i = 1:numOfFrame
    frame = readFrame(video);
    [bboxes,scores] = detect(model.detector,frame);
    %frame = insertObjectAnnotation(frame,'rectangle',bboxes,scores);
    frame = insertShape(frame, 'Rectangle', bboxes, 'LineWidth', 5);
    imshow(frame);
    pause(1/video.FrameRate);
end