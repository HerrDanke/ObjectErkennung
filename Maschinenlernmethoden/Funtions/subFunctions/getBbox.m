function [bbox] = getBbox(num)
    rect = getVideoRect(num);
    bbox = rect;
    emptyCells = cellfun (@isempty, bbox(:,1));
    bbox(emptyCells) = [];
end