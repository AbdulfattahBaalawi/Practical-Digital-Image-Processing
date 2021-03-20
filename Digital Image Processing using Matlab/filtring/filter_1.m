Original=imread('pout.tif');         %Read in image
BW = im2bw(Original,0.43);           %Convert into black and white image
 
minf=@(x) min(x(:));                %set 'min()' filter
maxf=@(x)max(x(:));                 %set 'max()' filter
min_Image=nlfilter(BW,[3 3],minf);  %Apply over 3 x 3 neighbourhood
max_Image=nlfilter(BW,[3 3],maxf);  %Apply over 3 x 3 neighbourhood
 
subplot(2,2,1), imshow(BW), title('Original');   %Display image
subplot(2,2,2), imshow(min_Image), title('Min'); %Display min image
subplot(2,2,3), imshow(max_Image), title('Max'); %Display max image

image = imread('pout.tif');
stretched_Image = imadjust(image, stretchlim(image, [0.05, 0.95]),[]);
subplot(2,2,1), imshow(image), title('Original Image');
subplot(2,2,2), imshow(stretched_Image), title('Strethced Image');
subplot(2,2,3), imhist(image), title('Histogram of Original Image');
subplot(2,2,4), imhist(stretched_Image), title('Histogram of Stretched Image');