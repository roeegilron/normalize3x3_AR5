function params = getparams()
% set some params. 
if ispc 
    params.datafold = 'F:\vocalDataSet\processedData\matFilesProcessedData';
else
    params.datafold = '/home/hezi/roee/vocalDataSet/extractedDataVocalDataSet/';
end

end