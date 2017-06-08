function res = testnet(im)
a = imresize(im,[71,71]);
load results50-2 net;
b = imcomplement(a);
b = imadjust(b,stretchlim(a,[.15 .90]),[]);
figure,imshow(b);
x = b(:);
y = net(x);
switch vec2ind(y)
    case 1
        res = 'A';
    case 2
        res = 'B';
    case 3
        res = 'C';
    case 4
        res = 'D';
    case 5
        res = 'E';
    case 6
        res = 'F';
    case 7
        res = 'G';
    case 8
        res = 'H';
    case 9
        res = 'I';
    case 10
        res = 'K';
    case 11
        res = 'L';
    case 12
        res = 'M';
    case 13
        res = 'N';
    case 14
        res = 'O';
    case 15
        res = 'P';
    case 16
        res = 'Q';
    case 17
        res = 'R';
    case 18
        res = 'S';
    case 19
        res = 'T';
    case 20
        res = 'U';
    case 21
        res = 'V';
    case 22
        res = 'W';
    case 23
        res = 'X';
    case 24
        res = 'Y';
end
end