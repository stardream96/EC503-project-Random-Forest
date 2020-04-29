% EC 503 term project.
% random forest algorithm, main file
% implemented by Bo Zhang, Linfeng Chen, Yi Zhang, Yunze Lian
clear
close all
%loading data
load('a9a.mat')

RFclassifier = TrainRF(Xtr, ytr, numTree);

acc = TestRF(Xte, yte, RFclassifier)

