% EC 503 term project.
% random forest algorithm, main file
% implemented by Bo Zhang, Linfeng Chen, Yi Zhang, Yunze Lian
clear
close all
%loading data
load('a9a.mat')
m = 100;
RFclassifier = TrainRF(Xtr, ytr, m, numTree);

acc = TestRF(Xte, yte, RFclassifier)

