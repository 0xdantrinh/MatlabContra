I10=imread('spin1.jpg');
I11=imread('spin2.jpg');
I12=imread('spin3.jpg');
I13=imread('spin4.jpg');
jj=1

ss=figure('position',[0 0 500 400]);
movegui(ss,'center')
set(ss,'color','white')

while jj==1
    imagesc(I10)
    pause(.05)
    drawnow
    imagesc(I11)
    pause(.05)
    drawnow
    imagesc(I12)
    pause(.05)
    drawnow
    imagesc(I13)
    pause(.05)
    drawnow
end
