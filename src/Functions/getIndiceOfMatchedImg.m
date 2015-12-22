function ind=getIndiceOfMatchedImg(Phi, F, test_img)

F_test = test_img * Phi;
for i=1:size(F,3)
    diff(:,:,i) = norm(F_test-F(:,:,i));
end

[val ind] = min(diff);


end