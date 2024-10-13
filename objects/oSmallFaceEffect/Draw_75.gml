draw_ext(face,image,x+introX,y,0.5,0.5,,,introAlpha);
print(text,x+40+introX,y+15,font,sep,width,0.5,0.5,angle,c1,c2,c3,c4,alpha*introAlpha,seed);

if (introX != 0) { introX-=25/10; }
if (introAlpha != 1) { introAlpha+=0.1; }