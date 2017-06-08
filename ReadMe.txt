Computer Vision for translation of ASL to English
Team Members:
Akanksha Singh(as9688)
Nitin Chaudhary(nc1710)
Rahul Khanna(rk2795)

Files:
Cropper.m - Code to crop images.
frameExtractor.m - Code to extract frame from videos
neuralnetwork.m - Code to train neural network and check for accuracy
preprpcessing.m - Code to preprocess images and to convert them to .mat file
target.mat - matrix containing output of training vectors
trainset.mat - matrix containing training vectors
Main Code - Contains trainned neural network and python script for foreground extraction
Bacground.py - Code to extract forground and feed to neural network
testnet.m - Code to classify incoming image
results50-2.mat - trained neural network

Running the Code:
Requirements - OpenCV(3.0 or higher)/MATLAB
Run Background.py
Wait till fgmask shows Time
Adjust your hand and wait till Time = 15 sec
You will get output on command prompt.

Other Files require the images to run.
except neuralnetwork.m.