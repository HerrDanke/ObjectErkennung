function [trainData] = getOneVideoData(num)
    img_path = getImgPath(num);
    bbox = getBbox(num);
    img_tb = table(img_path,'VariableNames',"imgName");
    bbox_tb = table(bbox,'VariableNames',"bbox");
    trainData = [img_tb,bbox_tb];
end