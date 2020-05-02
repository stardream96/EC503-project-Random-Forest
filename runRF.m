% EC 503 term project.
% random forest algorithm, main file
% implemented by Bo Zhang, Linfeng Chen, Yi Zhang, Yunze Lian
clear
close all
%loading data, the data should consist of 4 set of values, Xte, Xtr, yte,
%ytr with exact the name mentioned.
load('a9a.mat')
m = 5;
numTree = 30;
tic;
RFclassifier = TrainRF(Xtr, ytr, numTree,m);
toc
tic;
[acc,result] = TestRF(Xte, yte, RFclassifier);
% % confusion matrix if needed
% C = confusionmat(-yte,result);
% confusionchart(C)
toc