function [Impurity,I,threshold,sgn,index1,index2] = CSplit(X,y)
[m,l] = size(X);
         A = zeros(l,4);
         A(:,1) = X(1,:);
         A(:,2) = y(1,:);
         for i = 1:l
         A(i,4) = i;
         end
         C = sortrows(A,1);
         C(1,3) = C(1,2);
         for i = 2:l
             C(i,3) = C(i-1,3) + C(i,2);
         end
         if C(1,2) > 0             
         [M,I] = max(C(:,3));
         sgn = -1;
         N11 = -1*sum(A(:,2));
         N1 = (l-N11)/2;
         Impurity = (N1 - M) / N1;
         else
         [M,I] = min(C(:,3));
         sgn = 1;
         N11 = sum(A(:,2));
         N1 = (l-N11)/2;
         Impurity = (N1 - M) / N1;
         end
         threshold = C(I,1);
         index1 = C(1:I,4);
         index2 = C(I+1:end,4);
end