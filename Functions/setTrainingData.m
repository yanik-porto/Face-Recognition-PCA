function [D, X, I] = setTrainingData(fileName,nbr_pix)

Names = importdata(fileName);
nbr_stu = size(Names, 1);
%% Create Training data matrix D
for nth_stu = 1 : nbr_stu
    for nth_pix = 1:nbr_pix
        
        nth_img = (nth_stu-1)*nbr_pix+nth_pix;
        picName = [char(Names(nth_stu,:)), '_', num2str(nth_pix), '_64.jpg'];

        Img = imread(picName);
        I(:,:,nth_img) = double(Img);
        M = size(I, 1);
        N = size(I, 2);

        for i = 1 : M
            X(1,(i*N-(N-1)):((i-1)*N+N),nth_img) = I(i,:,nth_img);
            D(nth_img,(i*N-(N-1)):((i-1)*N+N)) = I(i,:,nth_img);
        end
    end
end

end