%[x,t] = iris_dataset;
load trainset;
load target;
net = patternnet(10);
%net.performFcn = 'mse';
%net.input.processFcns = {};
[net,tr] = train(net,trainset,target);
% net is the neural network trained
% tr is training record
view(net)
y = net(trainset); % net acts as a function and takes input the vectors we need to test
perf = perform(net,target,y); 
yclasses = vec2ind(y);
tclasses = vec2ind(target);
% To compare the results
accuracy = (sum(tclasses == yclasses)/numel(tclasses))*100;
disp(accuracy);
% performance on test set
tInd = tr.testInd;
tstOutputs = net(trainset(:,tInd));
tstPerform = perform(net,target(:,tInd),tstOutputs);
% accuracy on test set
yclasses = vec2ind(tstOutputs);
tclasses = vec2ind(target(:,tInd));
tstaccuracy = (sum(tclasses == yclasses)/numel(tclasses))*100;
disp(tstaccuracy)
% plotting performance and roc
figure, plotperform(tr);
figure, plotroc(target,y);