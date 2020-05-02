function RFclassifier = TrainRF(Xtr, ytr, numTrees, m, N)

%train Random Forest
%numTree: number of trees in the forest
%m: number of features selected out of total M features
%N: number of sample selected to train individual tree
M = size(Xtr,2);
RFclassifier = {numTrees};
if m>=M
    error('invalid m, m should not larger than total number of features')
end
if M<1
    error('invalid m, at least one feature should be choosed')
end
switch nargin
    case 4
        N = size(ytr,1);
    case 5
    otherwise
      error('not enough input')
end
M = size(Xtr,2);
for i = 1:numTrees
%bagging
i
    Xsubtr = zeros(N,M);
    ysubtr = zeros(N,1);
    idxm = randsample(M,m);
    for j = 1:N
        idx = ceil(rand()*numTrees);
        Xsubtr(j,idxm) = Xtr(idx,idxm);
        ysubtr(j) = ytr(idx);
    end
%training decision trees
    RFclassifier{i} = treeclassification(Xsubtr,ysubtr);
end
end