function targets = vote_treeclassifier(samples, indices, treeclassifier)  
    %Classify recursively using a tree  
    targets = zeros(1, size(samples,2));   %???????0   
    if (treeclassifier.dim == 0)          %??????
        targets(indices) = treeclassifier.child;  %???????????tree.child
        return  
    end  
      
    %????????
    %??????  
    dim = treeclassifier.dim;  %????
    dims= 1:size(samples,1);  %???????????
      
    %?????????????????
     Uf = unique(samples(dim,:)); %??
    for i = 1:length(Uf)  %???????
        if any(Uf(i) == treeclassifier.Nf)  %.NF???????????????
            in = indices(find(samples(dim, indices) == Uf(i)));  %???????????????==????????
            targets = targets + vote_treeclassifier(samples(dims, :), in, treeclassifier.child(find(Uf(i)==treeclassifier.Nf)), discrete_dim(dims), Uc);%??????????
        end  
    end  
    end       
    

