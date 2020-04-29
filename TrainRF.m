function classifier = TrainRF(Xtr, ytr, numTree, m, N)

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

%bagging


%training decision trees

end