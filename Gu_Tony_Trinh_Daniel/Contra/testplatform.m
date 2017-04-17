
tplatleng=.24
tplatwid=.22
tplatposx=.3
tplatposy=.35
tplatform= axes('position',[tplatposx tplatposy tplatleng tplatwid]) 
p=patch([.1 .30],[100 100],'r');
axis off


 function detectcolplatform
     if ypos==(tplatposy)
         if xpos>=tplatposx && xpos<=(tplatposx+tplatleng)
%              set(contraman,'position',[xpos ypos .12 .15])
%              Ialpha=imagesc(I)
%              set(Ialpha,'alphadata',a{1})
%              axis off
            jump=0
            platformstate=1
         end
     end
 end