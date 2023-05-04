
org = imread("Lenna.bmp");
A = rgb2gray(org);

B = 255 - A; % ネガ・ポジ変換
subplot(3, 2, 1);
imshow(B);
title('negaposi');
subplot(3, 2, 2);
imhist(B);
gamma = 1.5; % ガンマ値
C = uint8(255*(double(A)/255).^gamma); % ガンマ変換
subplot(3, 2, 3);
imshow(C);
title('gamma1');
subplot(3, 2, 4);
imhist(C);
gamma = 3;
D = uint8(255*(double(A)/255).^gamma);
subplot(3, 2, 5);
imshow(D);
title('gammma2');
subplot(3, 2, 6);
imhist(D);