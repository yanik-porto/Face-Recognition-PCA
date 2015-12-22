%% Compare the feature vectors
err=0;
for nTest=1:size(Xtest,3)
    Xq = Xtest(:,:,nTest);
    Iq = Itest(:,:,nTest);
    ind=getIndiceOfMatchedImg(Phi, F, Xq);
    Iz = Itrain(:,:,ind);

    %Check if correct or not
    if(ceil(ind/nbr_train) == ceil(nTest/nbr_test))
        res = 'correct';
    else
        res = 'wrong';
        err = err+1;
    end
end
display('Face Detection DONE');

%%  Show the two matched images
% figure;
% subplot(121),imshow(uint8(Iq)),title('test image');
% subplot(122),imshow(uint8(Iz)),title('matched train image');
% xlabel(res);

%% Output the correct accuracy
accuracy = (1-err/size(Xtest,3))*100;
display(accuracy);