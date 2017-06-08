workingDir = 'C:\Users\akank\Desktop\dolly\Fall16\CV\Project\Processed_images\';
trainset = zeros(5041,4280);
k=1;
for i = ['A','B','C','D','E','F','G','H','I','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y']
    mkdir(fullfile(workingDir,'processed_alphabets'),i);
    srcFiles = dir(fullfile(workingDir,'renamed_alphabets',i,'*.jpg'));
    for j = 1:length(srcFiles)
        image = imread(fullfile(workingDir,'renamed_alphabets',i,srcFiles(j).name));
        a = rgb2gray(image);
        b = imadjust(a,stretchlim(a,[.15 .90]),[]);
        fullname = fullfile(workingDir,'processed_alphabets',i,srcFiles(j).name);
        imwrite(b,fullname);
        trainset(:,k) = b(:);
        k=k+1;
    end
end
fullname = fullfile(workingDir,'trainset.mat');
save(fullname,'trainset');