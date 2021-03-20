I=imread('tire.tif');
imshow(I)
I2=im2double(I);
J=1*log(1+I2);
J1=0.3*log(1+I2);
J2=2*log(1+I2);
J3=5*log(1+I2);
JLessThanOne=1*log(0.3+I2);
figure, imshow(I), title('Original')
figure, imshow(J1), title('J1=0.3*log(1+I2);')
figure, imshow(J), title('I2=im2double(I)')
figure, imshow(J2), title('J2=2*log(1+I2)')
figure, imshow(J3), title('J3=5*log(1+I2)')
figure, imshow(J3), title('J3=5*log(1+I2)')
figure, imshow(JLessThanOne), title('JLessThanOne')
