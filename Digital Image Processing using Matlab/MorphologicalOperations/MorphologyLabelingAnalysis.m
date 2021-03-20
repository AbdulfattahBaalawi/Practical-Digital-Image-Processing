%% Bipul Mohanto
% Color in Informatics and MEdia Technology
% contact: bipul.mohanto@yahoo.com

clear all
close all
clc

%% structuring elements

I=imread('shapes.png');
BW=im2bw(I,graythresh(I));
imshow(BW);

SE=strel('line',11,45);
E1=imerode(BW,SE);
figure, imshow(E1);

SE =strel('disk',5);
E2=imerode(BW,SE);
figure, imshow(E2);

%% closing/opening

clear all;
close all;
clc;

I=imread('eng.png');
BW=im2bw(I,graythresh(I));
imshow(BW);
BW2 = imopen(BW,strel('disk',13));
DENTS=BW-BW2;
DENTSEXT=imopen(DENTS,strel('disk',3));
figure, imshow(DENTSEXT);

% version with imfill
clear all;
close all;
clc;

I=imread('eng.png');
BW=imfill(im2bw(I,graythresh(I)),'holes');
imshow(BW);
DENTS = BW-imopen(BW,strel('disk',13));
figure, imshow(DENTS);


%% top-hat
clear all;
close all;
clc;

I=imread('I12.bmp');
I2=imtophat(I,strel('disk',40));
BW=im2bw(I2,graythresh(I2));
imshow(BW);

%% binary options
clear all;
close all;
clc;

% solution à affiner notamment aux bords 
I=imread('maze1.bmp');
figure(1), imshow(I);

Ibw=im2bw(I);
SE=strel('square',3);
IThinned=bwmorph(Ibw,'skel',Inf);
figure(2), imshow(IThinned);
IPrunned=bwmorph(IThinned,'spur',Inf);
IP=uint8(IPrunned);
IP=IP .* 255;
ISub = imsubtract(I,IP);
figure(3), imshow(ISub);

%% labeling

I=imread('chro.bmp');
BW=im2bw(I); imshow(BW);
[L,num] = bwlabel(BW,8);
num

RGB = label2rgb(L,'jet',[0 0 0]); 
figure, imshow(RGB);


%% differences
clear all;
close all;
clc;

I1=imread('original.bmp');
I2=imread('original2.bmp');
SUB=max(I1-I2,I2-I1);
BW=im2bw(SUB);
ANA = imclose(BW,strel('disk',5));
[L,num] = bwlabel(ANA,8);
RGB = label2rgb(L,'jet',[0 0 0]); 
imshow(RGB);
num




clear all;
close all;
clc;

I=imread('chro.bmp');
BW=im2bw(I); imshow(BW);
BW2=imclearborder(BW);
[L,num] = bwlabel(BW2,8);
num

RGB = label2rgb(L,'jet',[0 0 0]); 
figure, imshow(RGB);


%% coins
clear all;
close all;
clc;

I=imread('coins.bmp');
BW=im2bw(I);
BW2=imfill(BW,'holes');
imshow(BW2);
[L,num] = bwlabel(BW2,8);

RGB = label2rgb(L,'jet',[0 0 0]); 
figure, imshow(RGB);

STATS = regionprops(L, 'Area');
TAB=[STATS.Area];

plot(TAB,'Linestyle','none','Marker','*');

class1=size(find(TAB >= 1500 & TAB <= 2000),2);
class2=size(find(TAB >= 2300 & TAB <= 2800),2);

Result=sprintf('Between %d objects: %d are of class1, %d are of class2.',num,class1,class2)

STATS = regionprops(L, 'Area','Perimeter');
SURF=[STATS.Area];
PERI=[STATS.Perimeter];
% equivalent radius
APPROX1=sqrt(SURF/pi)
APPROX2=PERI/(2*pi)

% Matlab choice
STATS = regionprops(L,'EquivDiameter');
APPROX=[STATS.EquivDiameter];
APPROX=APPROX/2
sprintf('The radius is approximated using f(Area) for a disk.')