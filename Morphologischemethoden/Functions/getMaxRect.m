function [rect_max] = getMaxRect(props)
    area_sum = [];
    rect_sum = [];
    for i = 1:length(props)
        rect = props(i).BoundingBox;
        rect_sum = [rect_sum; rect];
        area = rect(3) * rect(4);
        area_sum = [area_sum, area];
    end
    [~,area_index] = max(area_sum);
    rect_max = rect_sum(area_index,:);
end
