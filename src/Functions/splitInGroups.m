function [index]=splitInGroups(row_imgs,fileName,nameGirls)
Names = importdata(fileName);
s = size(Names,1);
ind=0;
nbr_img = size(row_imgs,3);
nImgs = 1:nbr_img;
nGirls = size(nameGirls,1);
% index(2,:)=nImgs;


for j=1:nGirls

    for i=1:s
        if(strcmp(char(Names(i,:)),char(nameGirls(j,:))))
            ind = i;
        end
    end
    
    girl=ind*3;
    index(1,(j-1)*3+1:nbr_img) = [girl girl-1 girl-2 zeros(1,size(row_imgs,3)-3*j)];
%     index(2,:) = [find(index(2,:)~=index(1,1+(j-1)*3) & index(2,:)~=index(1,2+(j-1)*3) ...
%     & index(2,:)~=index(1,3+(j-1)*3)) zeros(1,3)];
end

for i=1:nGirls*3    
    nImgs(1,index(1,i))=0;          
end
nImgs( :, ~any(nImgs,1) ) = [];
index(2,:) = [nImgs zeros(1, nGirls*3)];

end