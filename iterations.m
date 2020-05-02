function [X1,X2,y1,y2,index1,index2,tree] = iterations(X,y,index)
         X1 = 0;
         X2 = 0;
         y1 = 0;
         y2 = 0;
         index1 = 0;
         index2 = 0;
         global tree
         if index <-1
         index1 = tree(index,3);
         index2 = tree(index,4);
         [L,M] = size(X);
         Impurity_statistic = zeros(M,1);
         threshold_statistic = zeros(M,1);
         sgn_statistic = zeros(M,1);
         for i = 1:M
             [Impurity,I,threshold,sgn,index1,index2] = CSplit(X(:,i),y)
             Impurity_statistic(i,1) = Impurity;
             threshold_statistic(i,1) = threshold;
             sgn_statistic(i,1) = sgn;
         end
         [M_1,I_1] = min(Impurity_statistic);
         tree(index,1) = threshold_statistic(I_1);
         tree(index,2) = sgn_statistic(I_1);

         X1 = zeros(L,I);
         X2 = zeros(L,M-I);
         
         [Impurity,I,threshold,sgn,index1,index2] = CSplit(X(:,I_1),y);
         for i = 1:I
             X1(:,i) = X(:,index1(i));
             y1(i) = y(index1(i));
         end
         for i = I+1:M
             X2(:,i) = X(:,index2(i));
             y2(i) = y(index1(i));
         end
         iterations(X1,y1,index1);
         iterations(X2,y2,index2);
         end 
         tree = fitctree(X,y,'MaxNumSplits',4);
         
         

end