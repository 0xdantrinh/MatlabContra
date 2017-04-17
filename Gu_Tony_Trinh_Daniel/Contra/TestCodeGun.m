figure()
I=imread('Banner.jpg');
xpos=.1
ypos=.5
hh=axes('position',[xpos ypos .1 .1])

imagesc(I);

dead=0
while dead==0
    xpos=xpos+.01
    set(hh,'position',[xpos ypos .1 .1])
    pause(.1)
end