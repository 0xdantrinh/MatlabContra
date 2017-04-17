function dosomething
ss=figure('KeyPressFcn',@Dothing)

function Dothing(hObj,eventdata)
switch eventdata.Character
    case 'w'
        disp('w')
    case 'd'
        disp('d')
    case 'w' & 'd'
        disp('w and d')
end
end
end