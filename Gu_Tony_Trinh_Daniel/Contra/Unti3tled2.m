I=imread('Untitled.jpg')

ss=figure('position',[0 0 500 400]);
movegui(ss,'center')
h=imagesc(I);
for ang=1:360
  rotate(h,[1 0],1);
  drawnow;
end