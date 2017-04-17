function Contra2(lives,bombs)

% mbx=[NaN];
% mby=[NaN];
% vmb=0.05;

hiscore=0

weapon='M'
mgunsound=audioread('Mgun.wav');

ss=figure('position',[0 0 500 400]);
IB=imread('contra3stage1real.png');

livesCounter=uicontrol('style','text','String', lives,'fontsize',15,'position',[25 360 40 20],'callback',@startgame);
bombCounter=uicontrol('style','text','String', bombs,'fontsize',15,'position',[125 360 20 20],'callback',@startgame);
currentWeapon=uicontrol('style','text','String', weapon,'fontsize',15,'position',[85 360 20 20],'callback',@startgame);


background=axes('position',[0 0 19.67 1]);
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
[I25,nothing,a{25}]=imread('scorpflipped.png');
[I26,nothing,a{26}]=imread('gunnerflipped.png');
[I27,nothing,a{27}]=imread('rocketbullet.png');
[I28,nothing,a{28}]=imread('Running1.png');
[I29,nothing,a{29}]=imread('Running2.png');
[I30,nothing,a{30}]=imread('Running3.png');
[I31,nothing,a{31}]=imread('Running1L.png');
[I32,nothing,a{32}]=imread('Running2L.png');
[I33,nothing,a{33}]=imread('Running3L.png');

deads=audioread('Dead.wav');
bombsd=audioread('Atomic bomb sound effect.wav');
st=audioread('Star Wars Stormtrooper death sound effects.wav');

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
indc=0;
ind=1;
jump=0;
mgun=0;
bpos=0;
bvel=0;
bulletx=[1.5 2 2.5 3 3.5 4 .5 .5 .5 .5 .5 .5];
bullety=[-1.5 -2 -2.5 -3 -3.5 -4 -5 -5 -5 -5 -5 -5];
ebx=0
eby=0
ebulvel=1
bulinvincibility=0
epxi=1
epyi=12
egunpx=1
egunpy=12
epx=1*ones(1,10)
epy=12*ones(1,10)
elpx=1*ones(1,10)
elpy=12*ones(1,10)
elscpvel=1
egunvel=1
erctr=8
elctr=11
timerright=30;
timerleft=60;
timergunner=80;
platformstate=0;
gunnermoveright=0;
alphabulletblank13=a{18}

bullet1=axes('position',[1.5 1.5 .02 .02]);
alphabullet=imagesc(I18);
set(alphabullet,'alphadata',a{18})
axis off

bullet2=axes('position',[1.5 2 .02 .02]);
alphabullet=imagesc(I18);
alphabulletblank13(:)=0
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

EBul=axes('position',[epxi epyi .12 .12])
gunnerbullet= imagesc(I27);
set(gunnerbullet,'alphadata',a{27})
axis off

tplatleng(1)=20
ppos(1)=0
tplatposy(1)=.1

tplatleng(2)=.27
tplatwid(1:10)=.01
ppos(2)=3.41;
tplatposy(2)=.34375
platform=1

ppos(3)=3.57
tplatposy(3)=.647
tplatleng(3)=.454

ppos(4)=3.83
tplatposy(4)=.51
tplatleng(4)=.627

ppos(5)=8.01
tplatposy(5)=.335
tplatleng(5)=.265

ppos(6)=8.15
tplatposy(6)=.513
tplatleng(6)=.45

ppos(7)=8.43
tplatposy(7)=.335
tplatleng(7)=.265

ppos(8)=8.58
tplatposy(8)=.656
tplatleng(8)=.717

ppos(9)=8.83
tplatposy(9)=.522
tplatleng(9)=.62

ppos(10)=9.29
tplatposy(10)=.335
tplatleng(10)=.265

ppos(11)=18.6
tplatposy(11)=.316
tplatleng(11)=.35

ppos(12)=18.6
tplatposy(12)=.62
tplatleng(12)=.40


scorpion{1}=axes('position',[epxi epyi .12 .12])
Iscorpion1=imagesc(I24)
set(Iscorpion1,'alphadata',a{24})
axis off

scorpion{2}=axes('position',[epxi epyi .12 .12])
Iscorpion2=imagesc(I24)
set(Iscorpion2,'alphadata',a{24})
axis off

scorpion{3}=axes('position',[epxi epyi .12 .12])
Iscorpion3=imagesc(I24)
set(Iscorpion3,'alphadata',a{24})
axis off

scorpion{4}=axes('position',[epxi epyi .12 .12])
Iscorpion4=imagesc(I24)
set(Iscorpion4,'alphadata',a{24})
axis off

scorpion{5}=axes('position',[epxi epyi .12 .12])
Iscorpion5=imagesc(I24)
set(Iscorpion5,'alphadata',a{24})
axis off

scorpion{6}=axes('position',[epxi epyi .12 .12])
Iscorpion6=imagesc(I24)
set(Iscorpion6,'alphadata',a{24})
axis off

scorpion{7}=axes('position',[epxi epyi .12 .12])
Iscorpion7=imagesc(I24)
set(Iscorpion7,'alphadata',a{24})
axis off

scorpion{8}=axes('position',[epxi epyi .12 .12])
Iscorpion8=imagesc(I24)
set(Iscorpion8,'alphadata',a{24})
axis off

scorpion{9}=axes('position',[epxi epyi .12 .12])
Iscorpion9=imagesc(I24)
set(Iscorpion9,'alphadata',a{24})
axis off

scorpion{10}=axes('position',[epxi epyi .12 .12])
Iscorpion10=imagesc(I24)
set(Iscorpion10,'alphadata',a{24})
axis off

%Plot the gunner
gunner=axes('position',[epxi epyi .12 .12])
Igunner=imagesc(I26)
set(Igunner,'alphadata',a{26})
axis off


contraman=axes('position',[xpos ypos xsize ysize]);
Ialpha=imagesc(I)
set(Ialpha,'alphadata',a{1})
axis off
p=0
while d==0
     while p==1
                    pause()
     end
    
    %Countdown the Spawn timerrightr
    timerright=timerright-1;
    timerleft=timerleft-1;
    timergunner=timergunner-1;

    %Detect Collisions with the platforms
    bpos=bpos-bvel*.01;
     set(background,'position',[bpos 0 19.67 1]);
     
     ppos(:)=ppos(:)-bvel*.01;
     
     
    %Update Enemy Bullets
     if ebx~=epxi
            ebx = ebx - ebulvel*.02;
            eby = eby;
            set(EBul,'position',[ebx eby .02 .02])
     end
     % Die if hit by gunner bullet 
        if abs(ebx-xpos)<.05 && abs(eby-ypos)<.05 && bulinvincibility==0
            loseLife
            bulinvincibility=1;
        end
%     spawnEnemies
    if timergunner==0
        timergunner=80;
        spawnGunner
    end
    if timerright==0
        timerright=20;
        erctr=erctr-1;
        if erctr==0
            erctr=8;
        else
            spawnScorp
        end
    end
    if timerleft==0
        timerleft=50;
        elctr=elctr-1;
        if elctr==7
            elctr=11;
        else
            spawnlScorp
        end
    end

    %epx=epx-elscpvel*.02
    %Update Gunner Position
     if egunpx~=epxi

        if gunnermoveright==1
            egunpx = egunpx+egunvel*.01;
            egunpy = egunpy;
            set(gunner,'position',[egunpx egunpy .12 .12])
        else
            egunpx = egunpx - egunvel*.01;
            egunpy = egunpy;
            set(gunner,'position',[egunpx egunpy .12 .12])
        end
     end
     
    for fuk=1:7
        % epx(fuk)+.1000
        if (epx(fuk))==epxi
            continue
        else
            epx(fuk) = epx(fuk) - elscpvel*.02;
            epy(fuk) = epy(fuk);
            set(scorpion{fuk},'position',[epx(fuk) epy(fuk) .12 .12])
        end
    end
    for fuc=8:10
        if (elpx(fuc))==epxi
            continue
        else
            elpx(fuc) = elpx(fuc) + elscpvel*.015;
            elpy(fuc) = elpy(fuc);
            set(scorpion{fuc},'position',[elpx(fuc) elpy(fuc) .12 .12])
        end
    end
    
    
    
    
    set(livesCounter,'String',lives)
    set(bombCounter,'String',bombs)
    set(currentWeapon,'String',weapon)
    
    if down==1
        xvel=0;
        bvel=0;
    end
    xpos=xpos+xvel*.01;
    
    if xpos>.4
        bvel=1;
        xvel=0;
        if bpos>-18.66
        xpos=.40;
        end
    end
    
    if bpos<-18.66
        bvel=0;
        xvel=1;
    end
        
        
    
    if jump==1 & right==1 & xpos>.4
        bvel=1;
    end
    

    if jump==1
        ind=ind+1;
        %detectcolplatform
        if ind>24
            jump=0;
            ind=1;
        end
        for jj=1:10
        if (ypos-tplatposy(jj))<.03 && ind>12 && xpos<(ppos(jj)+tplatleng(jj)) && xpos>ppos(jj)
            jump=0;
            ypos=tplatposy(jj)-.2;
            ind=1;
            platformstate=1;
        end
        end
        if Orientation==1
            image1={I14 I15 I16 I17};
            alpha1=[14 15 16 17];
        else
            image1={I10 I11 I12 I13};
            alpha1=[10 11 12 13];
        end
        
        %animate guy as he jumps up
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
            %falling down
            
            
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
        
        if platformstate==0
            gravity=1;
        end
        
        if gravity==1
            ypos=ypos-.02;
        end
        
       
        for jj=1:10
        if abs(ypos-tplatposy(jj))<.02 & xpos<(ppos(jj)+tplatleng(jj)) & xpos>ppos(jj)
            platform=jj;
            platformstate=1;
            gravity=0;
        end
        end
        
         if xpos<ppos(platform) | xpos>(ppos(platform)+tplatleng(platform)) | ppos(platform)==NaN
            platformstate=0;
        end
        for jj=1:7
            if abs(epx(jj)-xpos)<.03 & abs(ypos-epy(jj))<.05 
                loseLife
                sound(deads);
            end
        end
        
        for jj=8:10
            if abs(elpx(jj)-xpos)<.03 & abs(ypos-elpy(jj))<.05 
                loseLife
                sound(deads);
            end
        end
        
        if mgun==1
            indb=indb+1;
            if indb==1
                if up==0 & Orientation==2
                    bulletx(1)=xpos;
                    bulletx(2)=xpos+.33;
                    bulletx(3)=xpos+.67;
                    if down==0
                        bullety(1:3)=ypos+.075;
                    else
                        bullety(1:3)=ypos+.038;
                    end
                end
                
                if up==0 & Orientation==1 
                    bulletx(1)=xpos;
                    bulletx(2)=xpos-.33;
                    bulletx(3)=xpos-.67;
                    if down==0
                        bullety(1:3)=ypos+.075;
                    else
                        bullety(1:3)=ypos+.038;
                    end
                end
                if up==1 & right==1
                    bulletx(7)=xpos+.12;
                    bulletx(8)=xpos+.3533;
                    bulletx(9)=xpos+.5866;
                    bullety(7)=ypos+.15;
                    bullety(8)=ypos+.3833;
                    bullety(9)=ypos+.6166;
                end
                  if up==1 & left==1
                    bulletx(10)=xpos;
                    bulletx(11)=xpos-.2333;
                    bulletx(12)=xpos+.4666;
                    bullety(10)=ypos+.15;
                    bullety(11)=ypos+.3833;
                    bullety(12)=ypos+.6166;
                end
                
                
                if up==1 & right==0 & left==0
                    bullety(4)=ypos;
                    bullety(5)=ypos+.33;
                    bullety(6)=ypos+.67;
                    bulletx(4:6)=xpos+.05
                end
            end
            if rem(indb, 32)==0 | indb==1
                sound(mgunsound)
            end
            if up==1
                if right==0 & left==0
                    bullety(4:6)=bullety(4:6)+.03;
                end
                if right==1
                    bullety(7:9)=bullety(7:9)+.03/sqrt(2);
                     bulletx(7:9)=bulletx(7:9)+.03/sqrt(2);
                end
                if left==1
                    bullety(10:12)=bullety(10:12)+.03/sqrt(2);
                    bulletx(10:12)=bulletx(10:12)-.03/sqrt(2);
                end
            end
            if Orientation==2
                if up==0
                    bulletx(1:3)=bulletx(1:3)+.03;
                end
            
               
            elseif Orientation==1
                if up==0
                    bulletx(1:3)=bulletx(1:3)-.03;
                end
            end
         
            
            for t=1:6
                if bulletx(t)>xpos+1 & up==0
                    bulletx(t)=xpos+.12;
                    set(alphabullet,'alphadata',a{18})
                end
                if bulletx(t)<xpos-1 & up==0
                    bulletx(t)=xpos;
                end
                if bullety(t)>ypos+1 & up==1
                    bullety(t)=ypos+.15;
                end
            end
            for t=7:12
                if bulletx(t)>xpos+1/sqrt(2) & bullety(t)>ypos+1/sqrt(2)
                    bulletx(t)=xpos+.12;
                    bullety(t)=ypos+.15;
                end
                if bulletx(t)<xpos-1/sqrt(2) & bullety(t)>ypos+1/sqrt(2)
                    bulletx(t)=xpos
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
        set(bullet10,'position',[bulletx(10) bullety(10) .03 .03])
        set(bullet11,'position',[bulletx(11) bullety(11) .03 .03])
        set(bullet12,'position',[bulletx(12) bullety(12) .03 .03])
        %              axes('position',[0 0 1 1])
        %              mbplt = plot(mbx,mby,'ro','MarkerSize',5,'MarkerFaceColor','r');
        %              axis([0 1 0 1])
        %              axis off
        
        if right==1 & up==1
            image=I20;
            alpha=20;
            ysize=.17;
            xsize=.11;
        end
        if left==1 & up==1
            image=I21;
            alpha=21;
            ysize=.17;
            xsize=.11;
        end
        
        if right==1 & down==0
            indc=indc+1
            xsize=.10
            if indc>14
                indc=indc-12
            end
            if indc<=4
                image=I28;
                alpha=28;
            elseif indc<=7
                image=I29;
                alpha=29;
            elseif indc<=11
                image=I30;
                alpha=30;
            else 
                image=I29;
                alpha=29;
            end
        end
        
         if left==1 & down==0
            indc=indc+1
            xsize=.10
            if indc>14
                indc=indc-12
            end
            if indc<=4
                image=I31;
                alpha=31;
            elseif indc<=7
                image=I32;
                alpha=32;
            elseif indc<=11
                image=I33;
                alpha=33;
            else 
                image=I32;
                alpha=32;
            end
        end
        %if platformstate==1
        % set (contraman,'position',[xpos tplatposy xsize ysize])
        %  hh=imagesc(image);
        %   set(hh,'alphadata',a{alpha});
        %    axis off;
        %    drawnow
        % else
        set(contraman,'position',[xpos ypos xsize ysize])
        hh=imagesc(image);
        set(hh,'alphadata',a{alpha});
        axis off;
        drawnow
        % end
        if xpos>1
            close all
            Contra2_3(hiscore);
        end
        if xpos<-.05 & xvel<0
            xvel=0;
        end
        if lives==0
            Dead
        end
    end
    if egunpx<.6
        gunnerFireBul
        %egunpx=epxi
        %egunpy=epyi
    end
    for nn=1:length(epx)
        if epx(nn)<-0.1 %|| epx(nn)>1.55
            %                epx(:,pp) = NaN;
            %                epy(:,pp) = NaN;
            %                r1(pp) = NaN;
            %                r2(pp) = NaN;
            epx(nn)=epxi;
            epy(nn)=epyi;
            set(scorpion{nn},'position',[epx(nn) epy(nn) .12 .12])
        end
    end
    for mm=8:10
        if elpx(mm)>1.55
            % %                epx(:,pp) = NaN;
            % %                epy(:,pp) = NaN;
            % %                r1(pp) = NaN;
            % %                r2(pp) = NaN;
            elpx(mm)=epxi;
            elpy(mm)=epyi;
            set(scorpion{mm},'position',[epx(mm) epy(mm) .12 .12])
        end
        %     disp(xpos)
    end
    
     for qq=1:7
        for rr=1:3
            if epx(qq)<1&&epx(qq)>0
                if abs(epx(qq)-bulletx(rr))<.03 && abs(epy(qq)-bullety(rr))<.1
                epx(qq)=epxi;
                epy(qq)=epyi;
                set(scorpion{qq},'position',[epx(qq) epy(qq) .12 .12])
                hiscore=hiscore+50;
                sound(st);
                break
                end
            end
        end
    end
    for qq=8:10
        for rr=1:2
            if elpx(qq)<1&&elpx(qq)>0
                if abs(elpx(qq)-bulletx(rr))<.03 && abs(elpy(qq)-bullety(rr))<.1
                elpx(qq)=epxi;
                elpy(qq)=epyi;
                set(scorpion{qq},'position',[elpx(qq) elpy(qq) .12 .12])
                hiscore=hiscore+50;
                sound(st);
                break
                end
            end
        end
    end
    for rr=1:12
        if egunpx<1&&egunpx>0
            if abs(egunpx-bulletx(rr))<.03 && abs(egunpy-bullety(rr))<0.1
                egunpx=epxi;
                egunpy=epyi;
                set(gunner,'position',[egunpx egunpy .12 .12])
                hiscore=hiscore+200;
                sound(st);
                break
            end
        end
    end
    %Move the gunner backwards once he shoots
    if egunpx<0.6
        gunnermoveright=1;
    end
    
    %Reset the gunner when he moves too far back
    if egunpx>1.6
        gunnermoveright=0;
        egunpx=epxi;
        egunpy=epyi;
        set(gunner,'position',[egunpx egunpy .12 .12])
    end
end
%     function updateEBul
%         if ebx==epxi
%             continue
%         else
%             ebx = ebx - ebulvel*.02;
%             eby = eby;
%             set(EBul,'position',[epx(fuk) epy(fuk) .02 .02])
%         end
%     end
    function gunnerFireBul
        ebx=egunpx+.01;
        eby=egunpy+.05;
        set(EBul,'position',[ebx eby .12 .12])
        bulinvincibility=0;
    end

%     function detectcolplatform
%      if ypos==(tplatposy)
%          if xpos>=tplatposx && xpos<=(tplatposx+tplatleng)
% %              set(contraman,'position',[xpos ypos .12 .15])
% %              Ialpha=imagesc(I)
% %              set(Ialpha,'alphadata',a{1})
% %              axis off
%             platformstate=1
%             ind=1000000
%             jump=0
%          end
%      end
%     end
    
    function updateEnemyPos
        if epx(fuk)~epxi
            epx(fuk) = epx(fuk) - elscpvel;
            epy(fuk) = epy(fuk);
            set(scorpion{fuk},'position',[epx(fuk) epy(fuk) .12 .12])
        end
    end
    function updatelEnemyPos
        if elpx(fuc)~epxi
            elpx(fuc) = elpx(fuc) - elscpvel;
            elpy(fuc) = elpy(fuc);
            set(scorpion{fuc},'position',[elpx(fuc) elpy(fuc) .12 .12])
        end
    end
    function spawnGunner
          %Randomly Spawn this guy
%           c=-1
%           b=1
%           rspawn=(b-c)*rand-b;
%           if rspawn>=0 
%         %Spawn enemy character in a designated location
          %Plot Enemy
            if get(gunner,'position')==[epxi epyi .12 .12]
                egunpx=1.5;
                egunpy=0.1;
                set(gunner,'position',[egunpx egunpy .12 .12]);
            end   
%           end
    end
    function spawnScorp
        %Randomly Spawn this guy
        c=-1;
        b=1;
        rspawn=(b-c)*rand-b;
        if rspawn>=0
            %Spawn enemy character in a designated location
            %Plot Enemy
            if get(scorpion{erctr},'position')==[epxi epyi .12 .12]
                epx(erctr)=1.5;
                epy(erctr)=0.1;
                set(scorpion{erctr},'position',[epx(erctr) epy(erctr) .12 .12]);
            end
        end
    end
    function spawnlScorp
        %Randomly Spawn this guy
        f=-2;
        e=2;
        rlspawn=(e-f)*rand;
        if rlspawn>=3
            %         %Spawn enemy character in a designated location
            %Plot Enemy
            if get(scorpion{elctr},'position')==[epxi epyi .12 .12]
                elpx(elctr)=-0.5;
                elpy(elctr)=0.1;
                set(scorpion{elctr},'position',[elpx(elctr) elpy(elctr) .12 .12]);
            end
        end
    end
    function FctnToCall(hObj,eventdata)
        switch eventdata.Character
            case 'n'
                loseLife
                bombs=1;
            case 'p'
                p=1
               
            case 'b'
                if bombs>0
                bombs=bombs-1;
                for qq=8:10
                elpx(qq)=epxi;
                elpy(qq)=epyi;
                set(scorpion{qq},'position',[elpx(qq) elpy(qq) .12 .12]);
                end
                for qq=1:7
                    epx(qq)=epxi;
                epy(qq)=epyi;
                set(scorpion{qq},'position',[epx(qq) epy(qq) .12 .12]);
                end
                
                egunpx=epxi;
                egunpy=epyi;
                set(gunner,'position',[egunpx egunpy .12 .12])
                
                sound(bombsd)
                end
            case 'w'
                kk=kk+1;
                if Orientation==1
                    image=I7;
                    alpha=7;
                    if kk==1
                        xpos=xpos+.032;
                    end
                else
                    image=I6;
                    alpha=6;
                end
                
                if kk==1 & Orientation==2
                    ypos=ypos-.014;
                end
                if kk==1 & Orientation==1
                    ypos=ypos-.011;
                end
                
                ysize=.21;
                xsize=.09;
                up=1;
            case 's'
                xsize=.165;
                ysize=.09;
                kk=kk+1;
                down=1;
                if Orientation==1
                    image=I9;
                    alpha=9;
                else
                    image=I8;
                    alpha=8;
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
                jump=1;
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
                image=I2;
                alpha=2;
            case 'p'
                p=0
            case 'd'
                xvel=0;
                right=0;
                bvel=0;
                image=I;
                xsize=.12
                alpha=1;
                ysize=.15;
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
                    ypos=ypos+.014;
                end
                if Orientation==1
                    ypos=ypos+.011;
                end
                
                
                
                ysize=.15;
                xsize=.12;
                up=0;
                kk=0;
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
                bulletx(:)=.5;
                bullety(:)=2;
                indb=0;
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
        d=1;
        imagesc(I5);
        livesCounter=uicontrol('style','text','String',hiscore,'fontsize',20,'position',[200 200 100 50]);
        set(ss,'color','black');
        movegui(ss,'center')
        axis off
    end
    function loseLife
        lives=lives-1;
        xpos=.1;
        ypos=.4;
        gravity=1;
        image=I;
        alpha=1
        set(contraman,'position',[.1 .125 .15 .12])
    end

end