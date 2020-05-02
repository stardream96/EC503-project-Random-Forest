function [tree] = treeclassification(X,y)
         treelevel = 3;
         tree = zeros(4,2^(treelevel+1));
         % threshold    sgn     c1     c2
         for i = 1:2^treelevel-1
             tree(3,i) = 2*i;
             tree(3,i) = 2*i+1;
         end
         for i = 2^treelevel:2^(treelevel+1)
             tree(3,i) = -1;
             tree(3,i) = -1;
         end
         
        [X1,X2,y1,y2,index1,index2,tree] =  iterations(X,y,1);                


end