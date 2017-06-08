workingDir = 'C:\Users\Nitin\Desktop\Alphabet Videos';
mkdir(workingDir,'images')

ii = 1;
for i = 1:28
    alphabetVideo = VideoReader(sprintf('%s','test',num2str(i),'.mp4'));
    fprintf(sprintf('%s','test',num2str(i),'.mp4'));
    while hasFrame(alphabetVideo)
       img = readFrame(alphabetVideo);
       filename = [sprintf('%03d',ii) '.jpg'];
       fullname = fullfile(workingDir,'images',filename);
       imwrite(img,fullname)    % Write out to a JPEG file (img1.jpg, img2.jpg, etc.)
       ii = ii+1;
    end
end