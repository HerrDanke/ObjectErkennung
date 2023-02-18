function [filenames] = getFileNames(path,suffix)
    file_path = path;
    file_suffix = suffix;
    files = dir([file_path, '*.', file_suffix]);
    filenames = {files.name}';
    filenames = string(filenames);
end