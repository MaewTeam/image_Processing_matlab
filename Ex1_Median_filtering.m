%Code matlab edit ver 2014


%Read data from image file by function name "imread" 
A=imread('GUI_Gabor2D/1_1.tif');
title('IMAGE WITH SALT AND PEPPER NOISE');
figure,imshow(A);
%{
%PAD THE MATRIX WITH ZEROS ON ALL SIDES
%???????????????????? ???? ??????? ????????? ?????

% ??????????? ???? modifyA ????? Matrix ??????????????????? ??????? ?????
% ???? ????? x ??? ?????????????????? ????????
%   0 0 0 0 0 0 0
%   0 0 0 0 0 0 0
%   0 0 1 2 3 0 0
%   0 0 4 5 6 0 0
%   0 0 7 8 9 0 0
%   0 0 0 0 0 0 0
%   0 0 0 0 0 0 0
%}
modifyA=zeros(size(A)+2);

% % ??????????? ???? B ??????????? ????????????? ??????????????????????????
%  ????? ???????? ????????? ???????????????????????????????????

B=zeros(size(A));
%{ 
 COPY THE ORIGINAL IMAGE MATRIX TO THE PADDED MATRIX
 ????? ?????? ??????????????????????? ?????????????? modifyA  ???
 ???? ???? Pad ????????????????????? 0 ????? ??? ??????
%}   
        for x=1:size(A,1)
            for y=1:size(A,2)
                modifyA(x+1,y+1)=A(x,y);
            end
        end
        
 %{ 
 ----------------------------------------------------
      LET THE WINDOW BE AN ARRAY
      STORE THE 3-by-3 NEIGHBOUR VALUES IN THE ARRAY
      SORT AND FIND THE MIDDLE ELEMENT
 ----------------------------------------------------
 %}

        
%---------------------------------------------------
% ???????? i ????????????????????????   ????? Y ???
%         j ?????????????????????????? ????? X
%---------------------------------------------------
for i= 1:size(modifyA,1)-2
    for j=1:size(modifyA,2)-2  
        
        window=zeros(9,1);
        
        inc=1;
%    ????????????? ???????????????????? ????????????????? 1D  
%    ???? 9 eliment

%    0  1  2
%    3  4  5
%    6  7  8

    % window[0-8] =0[..],1[..],2[..],3[..],4[..],5[..],6[..],7[..],8[..]

        for x=1:3
            for y=1:3
                window(inc)=modifyA(i+x-1,j+y-1);
                inc=inc+1;
            end
        end
 
    % ???????? ????????? window ????????????????????????? ???? ???? ??? 
    % med = 0[2],1[2],2[4],3[5],4[7],5[7],6[8],7[8],8[9]    
        med=sort(window);
     
     
        %PLACE THE MEDIAN ELEMENT IN THE OUTPUT MATRIX
%?????????????????????????? ????????????????     
        B(i,j)=med(5);
       
    end
end



%CONVERT THE OUTPUT MATRIX TO 0-255 RANGE IMAGE TYPE
B=uint8(B);
title('IMAGE AFTER MEDIAN FILTERING');
figure,imshow(B);