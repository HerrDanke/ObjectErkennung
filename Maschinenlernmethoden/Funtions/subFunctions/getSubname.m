function [subfilename] = getSubname(filename)
    subfilename = filename(1:end-4);
end