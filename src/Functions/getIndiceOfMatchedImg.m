function ind=getIndiceOfMatchedImg(Phi, F, test_img)

F_test = test_img * Phi;
for i=1:size(F,3)
    diff(:,:,i) = abs(F_test-F(:,:,i));
end

for i=1:size(F,3)
    nDiff(i) = norm(diff(:,:,i));
end

[val ind] = min(nDiff);


end