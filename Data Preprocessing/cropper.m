workingDir = 'C:\Users\Nitin\Desktop\Crop1';
mkdir(workingDir,'croppedimages')
for i = 1183:1194
    filename = [sprintf('%03d',i) '.jpg'];
    filename = strcat('C:\Users\Nitin\Desktop\Crop1\images\',filename);
    a = imread(filename);
    b = imcrop(a,[105 100 70 70]);
    filename1 = [sprintf('%03d',i) '.jpg'];
    fullname = fullfile(workingDir, 'croppedimages',filename1);
    imwrite(b,fullname)
    disp(i);
end