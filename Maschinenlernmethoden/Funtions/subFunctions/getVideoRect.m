function [rect] = getVideoRect(num)
    matPath = 'newMat\';
    mat_filenames = getFileNames(matPath,'mat');
    s = mat_filenames(num);
    groundTruth = load(s);
    gt = groundTruth.gTruth;
    labelData = gt.LabelData;
    rect = labelData.Object;
end