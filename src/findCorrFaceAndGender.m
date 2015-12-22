%% Enter number of image between 1 and 40
q=29;

%% Compare the feature vectors
err=0;
Xq = Xtest(:,:,q);
Iq = Itest(:,:,q);
ind=getIndiceOfMatchedImg(Phi, F, Xq);
Iz = Itrain(:,:,ind);

%Check if correct or not
if(ceil(ind/nbr_train) == ceil(q/nbr_test))
    res = 'correct';
    err = err+1;
else
    res = 'wrong';
end

display('Face Detection DONE');

%% classify test image
Xq = Xtest(:,:,q);
group=whichGroup(indexG,X,Xq,3);

display('Gender found');

%%  Show the two matched images
figure;
subplot(121),imshow(uint8(Iq)),title('test image');
if(group==1)
    xlabel('female');
else
    xlabel('male');
end
subplot(122),imshow(uint8(Iz)),title('matched training image');
xlabel(res);


