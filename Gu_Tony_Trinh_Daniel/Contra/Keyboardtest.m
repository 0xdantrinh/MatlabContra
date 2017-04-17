prompt = 'Do you want more? Y/N [Y]: ';
str = input(prompt,'s');
if isempty(str)
    str = 'Y';
end