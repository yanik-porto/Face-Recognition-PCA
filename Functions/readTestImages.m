function [Xtest, Itest] = readTestImages(fileName, nbr_pix)

Names = importdata(fileName);
nbr_stu = size(Names,1);

%% Read test images
for nth_stu = 1 : nbr_stu
    for nth_pic = 4:5
        
        nth_img = (nth_stu-1)*nbr_pix+mod(nth_pic,4-1);
        picName = [char(Names(nth_stu,:)), '_', num2str(nth_pic), '_64.jpg']; 
        
        Img2 = imread(picName);
        Itest(:,:,nth_img) = double(Img2);
        M2 = size(Itest, 1);
        N2 = size(Itest, 2);
        
        for i = 1 : M2
            Xtest(1,(i*N2-(N2-1)):((i-1)*N2+N2),nth_img) = Itest(i,:,nth_img);
        end        
    end
end


end