function g=whichGroup(indexGroups, row_imgs, Xq, k)

for i=1:size(row_imgs,3)
    diffG(i,:) = norm(Xq - row_imgs(:,:,i));
end
[minG, indG] = min(diffG);
classedDiff = sort(diffG);
for i=1:k
    class(i)=find(diffG == classedDiff(i));
    if(find(indexGroups(1,:)==class(i))>=1)
        kg(i)=1;
    else
        kg(i)=2;
    end
end

g = mode(kg);





end