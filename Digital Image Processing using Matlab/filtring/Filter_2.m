f=imread('cameraman.tif');
w=[0 1 0; 1 1 0;0 1 0]
g = imfilter(f, w, 'conv', 'replicate');
imshow(f);
figure,imshow(g);

A=imread('cameraman.tif');
H=(1/9)*[1 1 1; 1 1 1 ; 1 1 1];
H2=(1/25)*ones(5);
A=im2double(A);
F=imfilter(A,H,'replicate');
F2=imfilter(A,H2,'replicate');
subplot(2,2,1),imshow(A);
subplot(2,2,2),imshow(F);
subplot(2,2,3),imshow(F2);


a=imread('cameraman.tif');
a=im2double(a);
H=[1 1 1;1 -8 1;1 1 1]
f=imfilter(a,H);
f=mat2gray(f);
imshow(f)

f = medfilt2(a,[3 3]);
figure,imshow(f)


B = ordfilt2(A,5,ones(3,3))
B = ordfilt2(A,5,ones(3,3))
B = ordfilt2(A,5,ones(3,3))
B = ordfilt2(A,5,ones(3,3))
B = ordfilt2(A,1,[0 1 0; 1 0 1; 0 1 0])
%laplasian filter
a=imread('cameraman.tif');
a=im2double(a);
w=fspecial('log',[7 7],2);
filtered_img=imfilter(a,w,'replicate');
filtered_img=mat2gray(filtered_img);
imshow(filtered_img);