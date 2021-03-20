

    tire=imread('tire.tif');
    figure,imhist(tire);
    title('Histogram of tire.tif--Predominately Low Intensity');
    pout=imread('pout.tif');
    figure,imhist(pout);
    title('Histogram of pout.tif--Predominately Mid-range Intensity');
    eight=imread('eight.tif');
    figure, imhist(eight);
    title('Histogram of eight.tif--Predominately High Intensity');


I=imread('tire.tif');
J=imadjust(I,[],[],1);
J2=imadjust(I,[],[],3);
J3=imadjust(I,[],[],0.4);
imshow(J);
figure,imshow(J2), title("gama=3");
figure,imshow(J3), title("gama=0.4");
figure,imshow(J);
figure,imshow(I);
