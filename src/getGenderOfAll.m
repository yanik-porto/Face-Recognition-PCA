%% classify test image
k=3;
for q=1:size(Xtest,3)
    Xq = Xtest(:,:,q);
    group(q,:)=whichGroup(indexG,X,Xq,k);
end


%% Display all females
f=0;
row=ceil(sum(group(:,1)==1)/2);
figure;
for i=1:size(group,1)
    if(group(i,1)==1)
        f=f+1;
        subplot(row,2,f), imshow(uint8(Itest(:,:,i))),xlabel('female');
        title(['k = ',num2str(k)]);
    end
end