function [acc,result] = TestRF(Xte,yte, RFclassifier)
NumTree = size(RFclassifier,1); 
vt = zeros(NumTree,size(yte,1));

for i = 1:NumTree
    vt(i,:) = prediction_tree(RFclassifier{i},Xte);
 
end

result = mode(vt,1)';

count = 0;  

for i = 1:size(yte,1)-1
    if yte(i,1) == result(i)
        count = count+1;
    end
end
acc = count/size(yte,1);
fprintf('the testing accurcy is:%g%%\n', round(acc*100,2));
 end   
