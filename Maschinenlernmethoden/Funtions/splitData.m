function [Data_train,Data_test] = splitData(allData,ratio)
    n = size(allData,1);
    p = randperm(n);
    m = round(n*ratio);
    Data_train = allData(p(1:m),:);
    Data_test = allData(p(m+1:end),:);
end