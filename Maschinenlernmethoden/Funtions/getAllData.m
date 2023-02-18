function [allData] = getAllData()
    allData = [];
    for i = 1:10
        x = getOneVideoData(i);
        allData = [allData;x];
    end
end