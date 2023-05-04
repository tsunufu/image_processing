% 1. グレースケールにする。
img = imread('Lenna.bmp');
grayImg = rgb2gray(img);

% 2. 縦横1／4に縮小する。
smallImg = grayImg(1:4:end, 1:4:end);

% 3. 3つの補間法により、4倍に拡大したものを表示し、各拡大法によるPSNRの違いを求める。
nearestImg = imresize(smallImg, 4, 'nearest');
bilinearImg = imresize(smallImg, 4, 'bilinear');
bicubicImg = imresize(smallImg, 4, 'bicubic');

% 各拡大法によるPSNRを求める。
psnrNearest = psnr(nearestImg, grayImg);
psnrBilinear = psnr(bilinearImg, grayImg);
psnrBicubic = psnr(bicubicImg, grayImg);

% 結果を表示する。
figure(1);
subplot(3, 3, 1); imshow(grayImg); title('Original');
subplot(3, 3, 2); imshow(smallImg); title('Small');
subplot(3, 3, 3); imshow(nearestImg); title(['Nearest (PSNR = ' num2str(psnrNearest) ')']);
subplot(3, 3, 4); imshow(bilinearImg); title(['Bilinear (PSNR = ' num2str(psnrBilinear) ')']);
subplot(3, 3, 5); imshow(bicubicImg); title(['Bicubic (PSNR = ' num2str(psnrBicubic) ')']);
