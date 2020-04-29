function classifier = TrainRF(Xtr, ytr, numTrees, m, N)

%train Random Forest
%numTree: number of trees in the forest
%m: number of features selected out of total M features
%N: number of sample selected to train individual tree

if m>=M
    error('invalid m, m should not larger than total number of features')
if m<1
    error('invalid m, at least one feature should be choosed')
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
    Xsubtr = zeros(N,m);
    ysubtr = zeros(N,1);
    for j = 1:N
        idx = ceil(rand()*numTrees);
        idxm = randsample(M,m);
        for im = idxm
            Xsubtr(j,im) = Xtr(idx,im);
        end
        ysubtr(j) = ytr(idx);
    end
%training decision trees
end
end