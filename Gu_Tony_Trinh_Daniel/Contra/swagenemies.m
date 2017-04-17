[I24,nothing,a{24]]=imread('scorpionpic.png');

%Set maximum number of Enemies
numScorp=10
%Initialize Enemy Position
e1=ones(1,numScorp)*NaN
e2=ones(1,numScorp)*NaN
expos=NaN*ones(3,numScorp);
eypos=NaN*ones(3,numScorp);
epx=[NaN]
epy=[NaN]
evel=-1.2
%initialize timer
t=40
% contratimer=timer
% set(contratimer,'ExecutionMode','fixedRate','TimerFcn',@spawnScorp,'Period',1)
% %Put this inside the while loop 
% start(contratimer)

%refresh variables
[~, w] = size(epx);

t=t-1
%Set spawn rate on enemy
if t==0
%     a=-1
%     b=1
%     rspawn=(b-a)*rand-b;
%     if rspawn>0
%         spawnScorp
%     end
t=40
spawnScorp 
end

for jj = 1:w
        %Move all enemies
        updateEnemyPos
%         %Set spawn rate on enemy bullets
%         if rem(counter,300) == 0
%             enBul
%         end
end

if gunnert==0
    spawnGunner
end
function updateEnemyPos
    epx(:,kk) = epx(:,kk) - evel;
    epy(:,kk) = epy(:,kk)
    set(scorpion,'position',[epx epy .08 .08])
function spawnScorp
    %Randomly Spawn this guy
    a=-1
    b=1
    rspawn=(b-a)*rand-b;
    if rspawn>=0
    %Spawn enemy character in a designated location
    %Plot Enemy
    scorpion=axes('position',[epx epy .08 .08])
    Iscorp=imagesc(I24)
    set(Iscorp,'alphadata',a{24})
    axis off
    end
end
        
    