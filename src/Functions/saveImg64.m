function saveImg64(fileNames, imgs64, nbr_train, nbr_test)

mkdir('train_images_64');
mkdir('test_images_64');

Names = importdata(fileNames);
nbr_pix = nbr_train + nbr_test;
nbr_stu = size(Names,1);

for n=1:nbr_stu
    for i=1:nbr_pix
        if(i<=nbr_train)
            folder = 'train_images_64/';
        else
            folder = 'test_images_64/';
        end
            
        str = [folder,char(Names(n,:)),'_',num2str(i),...
             '_64.jpg'];                
        imwrite(imgs64(:,:,i+(n-1)*nbr_pix),str);
        folder = '';
        
        end
    end
end