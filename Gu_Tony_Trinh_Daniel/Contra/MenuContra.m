function MenuContra
%Initialize Menu Items and Background Music

ss=figure('position',[0 0 500 400]);
movegui(ss,'center')
set(ss,'color','black')
I3=imread('Banner.jpg');
axes('position',[.1 .6 .8 .3])
imagesc(I3);
axis off
score=0
I=imread('Controls.jpg');
I4=imread('Tony.jpg');
axes('position',[0 .1 .4 .5])
imagesc(I4);
axis off
lives=3;
bombs=1;
global lives
global bombs
I4=imread('Daniel.jpg');
axes('position',[.6 .1 .4 .5])
imagesc(I4);
axis off
A1=audioread('Kenny Loggins - Danger Zone.wav');
sound(A1);

%Initialize Menu Buttons
play=uicontrol('style','pushbutton','String', 'Start Game','position',[200 200 100 40],'callback',@startgame);
options=uicontrol('style','pushbutton','String', 'Options','position',[200 150 100 40],'callback',@gotooptions)
credits=uicontrol('style','pushbutton','String', 'Credits','position',[200 100 100 40],'callback',@gotocredits)
quit=uicontrol('style','pushbutton','String', 'Exit Game','position',[200 50 100 40],'callback',@quitgame)
help=uicontrol('style','pushbutton','String', '?','position',[470 396 30 30],'callback',@helpContra)

%Set each Menu Button's Corresponding Functions
%Set the Button Control Layout Help Menu
    function helpContra(source,callbackdata)
      clf  
      axes('position',[0 .1 1 .9])
      imagesc(I);
      back=uicontrol('style','pushbutton','String', 'Back','position',[200 50 100 40],'callback',@mainmenu)
      
    end
%Set Option Control Sliders for Bombs and Lives
    function gotooptions(source,callbackdata)
        clf
         back=uicontrol('style','pushbutton','String', 'Back','position',[200 50 100 40],'callback',@mainmenu)
            sld = uicontrol('Style', 'slider', 'Min',1,'Max',50,'Value',lives,'Position',[190 225 120 20],'Callback', @lifenumber); 
            ald = uicontrol('Style', 'slider', 'Min',1,'Max',10,'Value',bombs,'Position',[190 325 120 20],'Callback', @bombnumber); 
            livesCounter=uicontrol('style','text','String', lives,'fontsize',15,'position',[230 200 40 20])
            livesCounter=uicontrol('style','text','String', 'Lives','fontsize',15,'position',[210 250 80 20])
            bombsCounter=uicontrol('style','text','String', bombs,'fontsize',15,'position',[230 300 40 20])
            bombsCounter=uicontrol('style','text','String', 'Bombs','fontsize',15,'position',[210 350 80 20])
            function lifenumber(hObj,event)  
            lives= floor(get(hObj,'Value'))
            livesCounter=uicontrol('style','text','String', lives,'fontsize',15,'position',[230 200 40 20])
            end
            
            function bombnumber(hObj,event)
            bombs= floor(get(hObj,'Value'))
                        bombscounter=uicontrol('style','text','String', bombs,'fontsize',15,'position',[230 300 40 20])

            end
            
            
        
            
    end

 %Set Start Game Menu Button           
    function startgame(source,callbackdata)
        close all
        clear sound
        disp(lives)
        contraMap1(lives,bombs,score)
        
    end
 %Set the Credits Content and Button 
    function gotocredits(source,callbackdata)
        clf
        creditsText=uicontrol('style','text','string','11/20/2014 made by Tongda Gu and Daniel Trinh for ENGR 105 at University of Pennsylvania, we do not own the rights to the video game Contra, please do not sue us Konami thank you','position',[50 50 400 300],'Fontsize',20)
        back=uicontrol('style','pushbutton','String', 'Back','position',[10 375 100 40],'callback',@mainmenu)
        
    end
%Set the Quit Function of the game
    function quitgame(source,callbackdata)
        close all
        clear sound
    end
%Set the Main Menu Call Function
    function mainmenu(source,callbackdata)
            close all
            clear sound
            MenuContra
        end
end


