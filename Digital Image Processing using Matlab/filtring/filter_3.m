I = imread('peppers.png');
J = imnoise(I,'salt & pepper',0.2);

% filter each channel separately
r = medfilt2(J(:, :, 1), [3 3]);
g = medfilt2(J(:, :, 2), [3 3]);
b = medfilt2(J(:, :, 3), [3 3]);

% reconstruct the image from r,g,b channels
K = cat(3, r, g, b);

figure
subplot(121);imshow(J);
subplot(122);imshow(K);


h=fspecial('average',5)
results1=imfilter(I,h);
figure,imshow(results1)
title('Zero-Padded')
% 
% results2=imfilter(cat,h);
% figure,imshow(results2);
% title('Replicate')

% results3=imfilter(cat,h,'symmetric');
% figure,imshow(results3);
% title('Symmetric')
% 
% results4=imfilter(cat,h,'circular');
% figure,imshow(results4);
% title('Circular')