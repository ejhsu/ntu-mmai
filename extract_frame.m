% save all frames from mp4 %

% filter all *.mp4 %
files = dir(['/Users/EJHSU/Desktop/trailers/', '*.mp4']);

for i = 1:length(files)
    
    % for each file %
    video = files(i);
    videoObj = VideoReader(['/Users/EJHSU/Desktop/trailers/', video.name]);
    
    
    % create sub-folder %
    outFolderPath = [videoObj.Path, '/', video.name, '/'];
    outFolderPath = outFolderPath(1:end-5);
    if ~exist(outFolderPath, 'dir')
        mkdir(outFolderPath);
    end
    
    framesN = videoObj.NumberOfFrames;
    
    for framei = 1:framesN
        frameImage = read(v, framei);
        imwrite(frameImage, [outFolderPath, '/', num2str(framei), '.jpg']);
    end

end


