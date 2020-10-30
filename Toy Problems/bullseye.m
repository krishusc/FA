[y x] = meshgrid([-1000:1000],[-1000:1000]);
t = atan2(y,x);
b = 128+127*cos(t*10);
dispimage(b);
imwrite(b,'sin020.gif');
b = 128+127*cos(t*25);
dispimage(b);
imwrite(b,'sin050.gif');
b = 128+127*cos(t*50);
dispimage(b);
imwrite(b,'sin100.gif');

