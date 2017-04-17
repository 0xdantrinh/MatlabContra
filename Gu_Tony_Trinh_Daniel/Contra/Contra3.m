function Contra3(lives)

% mbx=[NaN];
% mby=[NaN];
% vmb=0.05;

hiscore=0
bombs=1
weapon='M'
mgunsound=audioread('Mgun.wav');

ss=figure('position',[0 0 500 400]);
IB=imread('contra3stage1real.png');

livesCounter=uicontrol('style','text','String', lives,'fontsize',15,'position',[25 360 40 20],'callback',@startgame);
bombCounter=uicontrol('style','text','String', bombs,'fontsize',15,'position',[125 360 20 20],'callback',@startgame);
currentWeapon=uicontrol('style','text','String', weapon,'fontsize',15,'position',[85 360 20 20],'callback',@startgame);


background=axes('position',[0 0 24.2902 1]);
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
[I26,nothing,a{26}]=imread('gunnerflipped.png');
[I27,nothing,a{27}]=imread('rocketbullet.png');


deads=audioread('Dead.wav');


I5=imread('Deathscreen.jpg');

jjj=1
xpos=.1;
ypos=.15;
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
bpos=0;
bvel=0;
bulletx=[1.5 2 2.5 3 3.5 4 .5 .5 .5 .5 .5 .5];
bullety=[1.5 2 2.5 3 3.5 4 5 5 5 5 5 5];
epxi=1
epyi=12
% epx=NaN*ones(1,10)
% epy=NaN*ones(1,10)
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
platformstate=0;
alphabulletblank13=a{18}
timergunner=80
gunnermoveright=0
ebx=0
eby=0
ebulvel=1
egunpx=1
egunpy=12

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

tplatleng(1)=1
tplatposx(1)=0
tplatposy(1)=.1
tplatleng(2)=.24
tplatwid(1:2)=.01
tplatposx(2)=.3
tplatposy(2)=.45
platform=1
tplatform= axes('position',[tplatposx(2) tplatposy(2) tplatleng(2) tplatwid(2)])
p=patch([.1 .30],[100 100],'r');
axis off

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

EBul=axes('position',[epxi epyi .12 .12])
gunnerbullet= imagesc(I27);
set(gunnerbullet,'alphadata',a{27})
axis off

gunner=axes('position',[epxi epyi .12 .12])
Igunner=imagesc(I26)
set(Igunner,'alphadata',a{26})
axis off


contraman=axes('position',[xpos ypos xsize ysize]);
Ialpha=imagesc(I)
set(Ialpha,'alphadata',a{1})
axis off


while d==0
    %Countdown the Spawn timerrightr
    timerright=timerright-1;
    timerleft=timerleft-1;
    %Detect Collisions with the platforms
    bpos=bpos-bvel*.01;
    
    
     timergunner=timergunner-1
     set(background,'position',[bpos 0 24.29 1])
    %spawnEnemies
    if timerright==0
        timerright=30;
        erctr=erctr-1;
        if erctr==0
            erctr=8;
        else
            spawnScorp
        end
    end
    if timerleft==0
        timerleft=60;
        elctr=elctr-1;
        if elctr==7
            elctr=11;
        else
            spawnlScorp
        end
    end
    
      if abs(ebx-xpos)<.05 && abs(eby-ypos)<.05 && bulinvincibility==0
            loseLife
            bulinvincibility=1
        end
    %spawnEnemies
    if timergunner==0
        timergunner=80
        spawnGunner
    end
    %epx=epx-elscpvel*.02
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
    
    
    % set(scorpion{10},'position',[epx(10) epy(10) .12 .12])
    
    set(livesCounter,'String',lives)
    set(bombCounter,'String',bombs)
    set(currentWeapon,'String',weapon)
    xpos=xpos+xvel*.01;
    
    if xpos>.4 
        bvel=1;
        xvel=0;
        xpos=.40
    end
    
    if jump==1 & right==1 & xpos>.4
        bvel=1;
    end
    
    if jump==1
        ind=ind+1
        %detectcolplatform
        if ind>24
            jump=0
            ind=1
        end
        for jj=1:2
        if (ypos-tplatposy(t))<.03 & ind>12 & xpos<(tplatposx+tplatleng) & xpos>tplatposx
            jump=0
            ypos=tplatposy(t)-.2
            ind=1
            platformstate=1
        end
        end
        if Orientation==1
            image1={I14 I15 I16 I17}
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
            
            
            ypos=ypos-.2/(13-(ind-12))
            
            
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
            gravity=1
        end
        
        if gravity==1
            ypos=ypos-.02
        end
        
       
        for t=1:2
        if abs(ypos-tplatposy(t))<.02 & xpos<(tplatposx(t)+tplatleng(t)) & xpos>tplatposx(t)
            platform=t
            platformstate=1
            gravity=0
        end
        end
        
         if xpos<tplatposx(platform) | xpos>(tplatposx(t)+tplatleng(t))
            platformstate=0
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
                        bullety(1:3)=ypos+.075
                    else
                        bullety(1:3)=ypos+.038
                    end
                end
                
                if up==0 & Orientation==1 
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
            if rem(indb, 32)==0 | indb==1
                sound(mgunsound)
            end
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
                    set(alphabullet,'alphadata',a{18})
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
                if abs(epx(qq)-bulletx(rr))<.03 && abs(.3-bullety(rr))<.25
                epx(qq)=epxi
                epy(qq)=epyi
                set(scorpion{qq},'position',[epx(qq) epy(qq) .12 .12])
                break
                end
            end
        end
    end
    for qq=8:10
        for rr=1:2
            if elpx(qq)<1&&elpx(qq)>0
                if abs(elpx(qq)-bulletx(rr))<.03 && abs(.3-bullety(rr))<.1
                elpx(qq)=epxi
                elpy(qq)=epyi
                set(scorpion{qq},'position',[elpx(qq) elpy(qq) .12 .12])
                break
                end
            end
        end
    end
    
    
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
            elpy(fuc) = elpy(fuc)
            set(scorpion{fuc},'position',[elpx(fuc) elpy(fuc) .12 .12])
        end
    end
    function spawnScorp
        %Randomly Spawn this guy
        c=-1;
        b=1;
        rspawn=(b-c)*rand-b;
        if rspawn>=0
            %         %Spawn enemy character in a designated location
            %Plot Enemy
            if get(scorpion{erctr},'position')==[epxi epyi .12 .12]
                epx(erctr)=1.5;
                epy(erctr)=0.3;
                set(scorpion{erctr},'position',[epx(erctr) epy(erctr) .12 .12])
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
                elpx(elctr)=-0.5
                elpy(elctr)=0.3
                set(scorpion{elctr},'position',[elpx(elctr) elpy(elctr) .12 .12])
            end
        end
    end
  function gunnerFireBul
        ebx=egunpx+.01
        eby=egunpy+.05
        set(EBul,'position',[ebx eby .12 .12])
        bulinvincibility=0
    end
    function spawnGunner
          %Randomly Spawn this guy
          c=-1
          b=1
          rspawn=(b-c)*rand-b;
          if rspawn>=0 
%         %Spawn enemy character in a designated location
          %Plot Enemy
            if get(gunner,'position')==[epxi epyi .12 .12]
                egunpx=1.5
                egunpy=0.315
                set(gunner,'position',[egunpx egunpy .12 .12])
            end   
          end
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
                bulletx(:)=.5
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
        ypos=.4;
        gravity=1;
        image=I;
        alpha=1
        set(contraman,'position',[.1 .125 .15 .12])
    end

end