function imgs64 = resizeImgto64(Names, nbr_stu, nbr_pix, coeffs)

sz_n = 64;
%% Resize each img
for nth_stu=1:nbr_stu
   for nth_pix = 1:nbr_pix;
        
        %Compute which img in the list
        nth_img = (nth_stu-1)*nbr_pix+nth_pix;
 
        %Get name of the file and upload
        picName = [char(Names(nth_stu,:)), '_', num2str(nth_pix), '.jpg'];
        img = rgb2gray(imread(picName));
        row_img = size(img,1);
        col_img = size(img,2);

        %Get back coeffs A and B in the matrix
        A = coeffs(1:2,1:2,nth_img)';
        B = coeffs(3,:,nth_img)';
        
%         out_img(:,:,nth_img)=uint8(zeros(sz_n,sz_n));

        % For each pxl in the output image compute the coordinates
        %%in the original one
        for i=1:sz_n
            for j=1:sz_n
                
                %Compute the inverse transform and retrieve cooresponding
                %pxl
                normPxl = abs(round(A\([j;i]-B)));                
                y = normPxl(1);
                x = normPxl(2);
                
                %If out of bounds
                if(x > row_img)
                    x = row_img;
                elseif(x < 1)
                    x = 1;
                end
                
                if(y > col_img)
                    y = col_img;
                elseif(y < 1)
                    y = 1;
                end                
                
                %Get the pixel value  
                imgs64(i,j,nth_img) = img(x,y);
            end        
        end
        
    end
end

end