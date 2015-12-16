Lt = importdata('lessNames.txt');
nbr_stu = size(Lt, 1);

nth_stu = 2;
nth_pic = 1;
    picName = [char(Lt(nth_stu,:)), '_', num2str(nth_pic), '.jpg'];
    Img = imread(picName);
    imshow(Img);
    
    sz_n = 64;
    row_img = size(Img,1);
    col_img = size(Img,2);
    I_n = zeros(sz_n);

    for i=1:sz_n
        for j=1:sz_n
            out_pxl((i-1)*sz_n+j,1:2)=[i j 1]*X2(:,:,4);           
        end        
    end
    
    col=uint8(abs(out_pxl(:,1)));
    
    %find(uint8(abs(out_pxl(:,1))==-70))
    