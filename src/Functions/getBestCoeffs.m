function [coeffs] = getBestCoeffs(Names, nbr_stu, nbr_pix)

nbr_img = nbr_stu * nbr_pix;
%% 1. Initialize average locations
Fb=[13 20 ;
    50 20 ;
    34 34 ;
    16 50 ;
    48 50 ];    

prev_Fb = ones(5,2)*100;    %Initialize with dumb value
threshold = 1;              %give a threshold
t=0;

%% 2. 3. Compute Best Transformation for each picture
while(max(max(abs(prev_Fb-Fb)))>threshold)

    %Get the coeffiients for each picture
    for nth_stu=1:nbr_stu
        for nth_pic = 1:nbr_pix;
                        
            %Compute num of img
            nth_img = (nth_stu-1)*nbr_pix+nth_pic;  
            
            %import data of the predetermined location from the file           
            str = [char(Names(nth_stu,:)),'_', num2str(nth_pic), '.txt'];
            
            %Compute the best coefficients
            [coeffs(:,:,nth_img), normCoor(:,:,nth_img)] = getCoeffs(str, Fb);
                       
        end
    end 
    
    %4. Update average locations 
    prev_Fb = Fb;
    Fb = zeros(5,2);
    for i=1:nbr_img
        Fb = Fb + normCoor(:,:,i);
    end
    Fb = Fb ./ nbr_img;
    
    %5. while the difference btw the new average and the previous one is
    %%too big, repeat !
    t=t+1;
    display([num2str(t/6*100),'%']);
end

end