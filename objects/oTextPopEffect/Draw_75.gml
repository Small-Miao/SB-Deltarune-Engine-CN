print(text,x,y,font,sep,width,xscale,yscale,angle,c1,c2,c3,c4,alpha*image_alpha,seed);

y-=2;
image_alpha-=1/15;
if (image_alpha <= 0) { instance_destroy(); }