function Contra

% mbx=[NaN];
% mby=[NaN];
% vmb=0.05;
lives=3
hiscore=0
bombs=1
weapon='M'
% mgunsound=audioread('Mgun.mp3');

ss=figure('position',[0 0 500 400]);
IB=imread('backgroundContra1.png');

livesCounter=uicontrol('style','text','String', lives,'fontsize',15,'position',[25 360 20 20],'callback',@startgame);
bombCounter=uicontrol('style','text','String', bombs,'fontsize',15,'position',[105 360 20 20],'callback',@startgame);
currentWeapon=uicontrol('style','text','String', weapon,'fontsize',15,'position',[65 360 20 20],'callback',@startgame);


background=axes('position',[0 0 12.1698 1]);
imagesc(IB);
axis off

set(ss,'KeyPressFcn',@FctnToCall,'KeyReleaseFcn',@FctnToCallR);
movegui(ss,'center')
set(ss,'color','white')

a=[];

[I,nothing,a{1}]=imread('contraCharacterFoward.png');
[I2,nothing,a{2}]=imread('contraCharacterBackwards.png');
[I6,nothing,a{6}]=imread('contraCharacterPoint up.png');
[I7,nothing,a{7}]=imread('contraCharacterPointupL.png');
[I8,nothing,a{8}]=imread('contraLyingDownR.png');
[I9,nothing,a{9}]=imread('contraLyingDownL.png');
[I10,nothing,a{10}]=imread('spin1.png');
[I11,nothing,a{11}]=imread('spin2.png');
[I12,nothing,a{12}]=imread('spin3.png');
[I13,nothing,a{13}]=imread('spin4.png');
[I14,nothing,a{14}]=imread('spinL1.png');
[I15,nothing,a{15}]=imread('spinL2.png');
[I16,nothing,a{16}]=imread('spinL3.png');
[I17,nothing,a{17}]=imread('spinL4.png');
[I18,nothing,a{18}]=imread('bullet.png');
[I19,nothing,a{19}]=imread('bulletup.png');
[I20,nothing,a{20}]=imread('contraCharacterPointdiagR.png');
[I21,nothing,a{21}]=imread('contraCharacterPointdiagL.png');
[I22,nothing,a{22}]=imread('bulletDiagR.png');
[I23,nothing,a{23}]=imread('bulletDiagL.png');
[I24,nothing,a{24}]=imread('scorpionpic.png');



I5=imread('Deathscreen.jpg');

jjj=1
xpos=.1;
ypos=.3;
image=I;
jj=1;
Orientation=2;
xvel=0;
d=0;
ysize=.15;
xsize=.12;
kk=0;
right=0;
left=0;
up=0;
down=0;
alpha=1;
indb=0;
ind=1;
jump=0;
mgun=0;
bpos=0
bvel=0
bulletx=[1.5 2 2.5 3 3.5 4 5 5.5 6];
bullety=[1.5 2 2.5 3 3.5 4 5 5.5 6];

%Set maximum number of Enemies
numScorp=10
%Initialize Enemy Position
e1=ones(1,numScorp)*NaN
e2=ones(1,numScorp)*NaN
expos=NaN*ones(1,numScorp);
eypos=NaN*ones(1,numScorp);
epx=[1]
epy=[10]
evel=-1.2
%initialize timer
t=1

bullet1=axes('position',[1.5 1.5 .02 .02]);
alphabullet=imagesc(I18);
set(alphabullet,'alphadata',a{18})
axis off

bullet2=axes('position',[1.5 2 .02 .02]);
alphabullet=imagesc(I18);
set(alphabullet,'alphadata',a{18})
axis off

bullet3=axes('position',[1.5 2.5 .02 .02]);
alphabullet=imagesc(I18);
set(alphabullet,'alphadata',a{18})
axis off

bullet4=axes('position',[1.5 2.5 .02 .02]);
alphabullet=imagesc(I19);
set(alphabullet,'alphadata',a{19})
axis off

bullet5=axes('position',[1.5 2.5 .02 .02]);
alphabullet=imagesc(I19);
set(alphabullet,'alphadata',a{19})
axis off

bullet6=axes('position',[1.5 2.5 .02 .02]);
alphabullet=imagesc(I19);
set(alphabullet,'alphadata',a{19})
axis off

bullet7=axes('position',[1.5 2.5 .02 .02]);
alphabullet=imagesc(I22);
set(alphabullet,'alphadata',a{22})
axis off

bullet8=axes('position',[1.5 2.5 .02 .02]);
alphabullet=imagesc(I22);
set(alphabullet,'alphadata',a{22})
axis off

bullet9=axes('position',[1.5 2.5 .02 .02]);
alphabullet=imagesc(I22);
set(alphabullet,'alphadata',a{22})
axis off

bullet10=axes('position',[1.5 2.5 .02 .02]);
alphabullet=imagesc(I23);
set(alphabullet,'alphadata',a{23})
axis off

bullet11=axes('position',[1.5 2.5 .02 .02]);
alphabullet=imagesc(I23);
set(alphabullet,'alphadata',a{23})
axis off

bullet12=axes('position',[1.5 2.5 .02 .02]);
alphabullet=imagesc(I23);
set(alphabullet,'alphadata',a{23})
axis off


contraman=axes('position',[xpos ypos xsize ysize]);
Ialpha=imagesc(I)
set(Ialpha,'alphadata',a{1})
axis off

%Spawn enemy character in a designated location
%Plot Enemy
scorpion=axes('position',[epx epy .08 .08])
Iscorp=imagesc(I24)
set(Iscorp,'alphadata',a{24})
axis off



while d==0
    %countdown timer
    t=t-1
    
    %refresh variables
    %[~, w] = size(epx);
    
    if t==0
    %     a=-1
    %     b=1
    %     rspawn=(b-a)*rand-b;
    %     if rspawn>0
    %         spawnScorp
    %     end
    t=1
    spawnScorp 
    end
%     if gunnert==0
%     spawnGunner
%     end
   % for jj = 1:w
        %Move all enemies
%        updateEnemyPos
%         %Set spawn rate on enemy bullets
%         if rem(counter,300) == 0
%             enBul
%         end
   % end
    set(livesCounter,'String',lives)
    set(bombCounter,'String',bombs)
    set(currentWeapon,'String',weapon)
    xpos=xpos+xvel*.01;
    bpos=bpos-bvel*.01
      if xpos>.4
                bvel=1;
                xvel=0;
                xpos=.40
                end
    if jump==1
        ind=ind+1
        if ind>24
            jump=0
            ind=1
        end
        if Orientation==1
            image1={I14 I15 I16 I17}
            alpha1=[14 15 16 17];
        else
            image1={I10 I11 I12 I13};
            alpha1=[10 11 12 13];
        end
        
        
        if ind<13 & ind>0
            ypos=ypos+.2/ind;
            set(contraman,'position',[xpos ypos .08 .08])
            if ind<4
                hh=imagesc(image1{1});
                alpha2=alpha1(1);
            elseif ind<7
                hh=imagesc(image1{2});
                alpha2=alpha1(2);
            elseif ind<10
                hh=imagesc(image1{3});
                alpha2=alpha1(3);
            else
                hh=imagesc(image1{4});
                alpha2=alpha1(4);
            end
            set(hh,'alphadata',a{alpha2})
            axis off
            drawnow
            pause(.02)
        else
            
            ypos=ypos-.2/(13-(ind-12));
            
            set(contraman,'position',[xpos ypos .08 .08])
            if ind<16
                hh= imagesc(image1{1});
                alpha2=alpha1(1);
            elseif ind<19
                hh=imagesc(image1{2});
                alpha2=alpha1(2);
            elseif ind<22
                hh=imagesc(image1{3});
                alpha2=alpha1(3);
            else
                hh=imagesc(image1{4});
                alpha2=alpha1(4);
            end
            set(hh,'alphadata',a{alpha2})
            axis off
            drawnow
            pause(.02)
        end
    else
        
       
       
        if mgun==1
            indb=indb+1;
            if indb==1
                if up==0 & Orientation==2 & right==0 & left==0
                    bulletx(1)=xpos;
                    bulletx(2)=xpos+.33;
                    bulletx(3)=xpos+.67;
                      if down==0
                        bullety(1:3)=ypos+.075
                    else
                        bullety(1:3)=ypos+.038
                    end
                end
                
                if up==0 & Orientation==1 & right==0 & left==0
                    bulletx(1)=xpos;
                    bulletx(2)=xpos-.33;
                    bulletx(3)=xpos-.67;
                    if down==0
                        bullety(1:3)=ypos+.075
                    else
                        bullety(1:3)=ypos+.038
                    end
                end
                if up==1 & right==1
                    bulletx(7)=xpos
                    bulletx(8)=xpos+.2333
                    bulletx(9)=xpos+.4666
                    bullety(7)=ypos
                    bullety(8)=ypos+.2333
                    bullety(9)=ypos+.4666
                end
                
               
                
                if up==1 & right==0 & left==0
                    bullety(4)=ypos;
                    bullety(5)=ypos+.33;
                    bullety(6)=ypos+.67;
                    bulletx(4:6)=xpos+.05
                end
            end
            %             if rem(indb, 30)==0 | indb==1
            %                 sound(mgunsound)
            %             end
            if up==1  
                if right==0 & left==0
                bullety(4:6)=bullety(4:6)+.03;
                end
                if right==1
                    bullety(7:9)=bullety(7:9)+.03/sqrt(2);
                end
            end
            if Orientation==2 
                if up==0
                    bulletx(1:3)=bulletx(1:3)+.03;
                end
                if up==1 & right==1
                    bulletx(7:9)=bulletx(7:9)+.03/sqrt(2);
                end
            elseif Orientation==1
                if up==0
                bulletx(1:3)=bulletx(1:3)-.03;
                end
                 if up==1 & left==1
                    bulletx(7:9)=bulletx(7:9)-.03/sqrt(2);
                end
            end
            for t=1:6
                if bulletx(t)>xpos+1 & up==0
                    bulletx(t)=xpos+.12;
                end
                if bulletx(t)<xpos-1 & up==0
                    bulletx(t)=xpos;
                end
                if bullety(t)>ypos+1 & up==1
                    bullety(t)=ypos+.15;
                end
            end
            for t=7:9
                if bulletx(t)>xpos+1/sqrt(2)
                    bulletx(t)=xpos+.12
                    bullety(t)=ypos+.15
                end
            end
        end
        
        set(bullet1,'position',[bulletx(1) bullety(1) .02 .02])
        set(bullet2,'position',[bulletx(2) bullety(2) .02 .02])
        set(bullet3,'position',[bulletx(3) bullety(3) .02 .02])
        set(bullet4,'position',[bulletx(4) bullety(4) .02 .02])
        set(bullet5,'position',[bulletx(5) bullety(5) .02 .02])
        set(bullet6,'position',[bulletx(6) bullety(6) .02 .02])
         set(bullet7,'position',[bulletx(7) bullety(7) .03 .03])
          set(bullet8,'position',[bulletx(8) bullety(8) .03 .03])
           set(bullet9,'position',[bulletx(9) bullety(9) .03 .03])
           
        %              axes('position',[0 0 1 1])
        %              mbplt = plot(mbx,mby,'ro','MarkerSize',5,'MarkerFaceColor','r');
        %              axis([0 1 0 1])
        %              axis off
        
        if right==1 & up==1
            image=I20;
            alpha=20
            ysize=.17
            xsize=.11
        end
        if left==1 & up==1
            image=I21;
            alpha=21
            ysize=.17
            xsize=.11
        end
        
        set(background,'position',[bpos 0 12.1698 1])
        
        set(contraman,'position',[xpos ypos xsize ysize])
        hh=imagesc(image);
        set(hh,'alphadata',a{alpha})
        axis off
        drawnow
        if xpos>.95 & xvel>0
            xvel=0;
        end
        if xpos<-.05 & xvel<0
            xvel=0;
        end
        if lives==0
            Dead
        end
    end
    disp(t)
end


    function FctnToCall(hObj,eventdata)
        switch eventdata.Character
            case 'n'
                loseLife
                bombs=1
            case 'b'
                bombs=bombs-1
            case 'w'
                kk=kk+1;
                if Orientation==1
                    image=I7;
                    alpha=7
                    if kk==1
                        xpos=xpos+.032
                    end
                else
                    image=I6;
                    alpha=6
                end
                
                if kk==1 & Orientation==2
                    ypos=ypos-.014
                end
                if kk==1 & Orientation==1
                    ypos=ypos-.011
                end
                
                ysize=.21;
                xsize=.09;
                up=1
            case 's'
                xsize=.165;
                ysize=.09;
                kk=kk+1;
                down=1;
                if Orientation==1
                    image=I9;
                    alpha=9
                else
                    image=I8;
                    alpha=8
                end
                
                if kk==1 & Orientation==2
                    xpos=xpos-.045;
                end
                
            case 'a'
                Orientation=1;
                xsize=.12;
                ysize=.15;
                xvel=-1;
                image=I2;
                left=1;
                alpha=2;
            case 'd'
                
                Orientation=2;
                ysize=.15;
                xsize=.12;
                xvel=1;
                image=I;
                right=1;
                alpha=1;
              
            case 'j'
                jump=1
            case 'k'
                %shoot bullet
                %                mbx(1)=xpos
                mgun=1;
                
            case 'q'
                d=0;
                
                close all
                MenuContra
                return
                
        end
        
    end
    function FctnToCallR(hObj,eventdata)
        switch eventdata.Character
            case 'a'
                xvel=0;
                left=0;
            case 'd'
                xvel=0;
                right=0;
                bvel=0;
            case 'w'
                if Orientation==1;
                    image=I2;
                    alpha=2;
                    xpos=xpos-.032
                else
                    image=I;
                    alpha=1;
                end
                if Orientation==2
                    ypos=ypos+.014
                end
                if Orientation==1
                    ypos=ypos+.011
                end
                
                
                
                ysize=.15;
                xsize=.12;
                up=0;
                kk=0
            case 's'
                if Orientation==2
                    image=I;
                    alpha=1;
                    xpos=xpos+.045;
                else
                    image=I2;
                    alpha=2;
                end
                down=0;
                kk=0;
                ysize=.15;
                xsize=.12;
            case 'k'
                mgun=0
                bulletx(:)=2
                bullety(:)=2
                indb=0
                %                 mbx=NaN
                %                 mby=NaN
        end
    end
%     function mgun
%        %laserind=isnan(mbx);
%         %laserpos=find(mbx,1,'first')
%         mbx(end+1)=mbx(end)+0.06
%         mby(end+1)=ypos+.075
%     end
    function Dead
        clf
        d=1
        imagesc(I5)
        livesCounter=uicontrol('style','text','String',hiscore,'fontsize',20,'position',[250 200 50 50]);
        set(ss,'color','black')
        movegui(ss,'center')
        axis off
    end
    function loseLife
    lives=lives-1   
    xpos=.1;
    ypos=.3;
    image=I;
    alpha=1
    set(contraman,'position',[.1 .125 .15 .12])
    end
    function updateEnemyPos
    epx(:) = epx - evel;
    epy(:) = epy
    set(scorpion,'position',[epx epy .08 .08])
    drawnow
    end
    function spawnScorp
    %Randomly Spawn this guy
    a=-1
    b=1
    rspawn=(b-a)*rand-b;
    if rspawn>=0
%     %Spawn enemy character in a designated location
%     %Plot Enemy
%     scorpion=axes('position',[epx epy .08 .08])
%     Iscorp=imagesc(I24)
%     set(Iscorp,'alphadata',a{24})
%     axis off
    set(scorpion,'position',[1 .3 .08 .08])
    end
    end


end