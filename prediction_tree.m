function [result] = prediction_tree(tree,X)
         i = 1;
         m = 0;
         tree1 = zeros(1,4);
         while tree1(i,3) ~= 0 
              m = ( X - tree(i,1))*tree(i,2);
              if m < 0
                  i = tree(i,3);
              else
                  i = tree(i,4);
              end
         end
         result = predict(tree,X);                   
end