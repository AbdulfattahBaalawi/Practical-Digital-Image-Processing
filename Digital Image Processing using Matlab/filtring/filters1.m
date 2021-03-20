originalRGB = imread('peppers.png');
figure,
imshow(originalRGB);
% % h = fspecial('motion', 50, 45);
% % filteredRGB = imfilter(originalRGB, h);
% % figure, imshow(filteredRGB)
% % boundaryReplicateRGB = imfilter(originalRGB, h, 'replicate');
% % figure, imshow(boundaryReplicateRGB)
noise_mean = 0;
noise_var = 0.0001;
blurred_noisy = imnoise(originalRGB,'gaussian',noise_mean,noise_var);
figure,
imshow(blurred_noisy);
title('Blurred and Noisy Image');
I=originalRGB;
J1 = imnoise(I,'gaussian');
% J = imnoise(I,'gaussian',m)
% J = imnoise(I,'gaussian',m,var_gauss)
% %  var_local=0.2
J2=J1;
%  J2= imnoise(I,'localvar',var_local)
% J2 = imnoise(I,'localvar',intensity_map,var_local)
J3 = imnoise(I,'poisson');
J4 = imnoise(I,'salt & pepper');
% J = imnoise(I,'salt & pepper',d)
J5 = imnoise(I,'speckle')
% % J = imnoise(I,'speckle',var_speckle)

subplot(2,3,1),imshow(J1),title("imnoise(I,'gaussian')");
subplot(2,3,2),imshow(J2),title("imnoise(I,'gaussian')");
subplot(2,3,3),imshow(J3),title("imnoise(I,'poisson')");
subplot(2,3,4),imshow(J4),title("imnoise(I,'salt & pepper')");
subplot(2,3,5),imshow(J5),title("imnoise(I,'speckle')");
% subplot(2,3,6),imshow(J1),title("imnoise(I,'gaussian')");

edgeThreshold = 0.4;
amount = 0.5;
B = localcontrast(I, edgeThreshold, amount);
figure,
imshowpair(I, B, 'montage')