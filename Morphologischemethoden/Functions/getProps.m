function [props,im] = getProps(frame,backGround)
    diff = double(frame) - double(backGround);
    mask = diff > 20;
    im = double(mask);
    im_gray = rgb2gray(im);
    im_edges = edge(im_gray,"canny");
    cc = bwconncomp(im_edges);
    props = regionprops(cc,"BoundingBox");
end