// This code is sourced from
// https://asymptote.sourceforge.io/gallery/logo.asy
// I claim no ownership of it or the logo design

picture logo(pair s=0, pen q)
{
  picture pic;
  pen p=linewidth(2)+fontsize(24pt)+q;
  real a=-0.4;
  real b=0.95;
  real y1=-5;
  real y2=-3y1/2;
  path A=(a,0){dir(10)}::{dir(89.5)}(0,y2);
  draw(pic,A,p);
  draw(pic,(0,y1){dir(88.3)}::{dir(20)}(b,0),p);
  real c=0.5*a;
  pair z=(0,2.5);
  label(pic,"{\it symptote}",z,0.25*E+0.169S,p);
  pair w=(0,1.7);
  draw(pic,intersectionpoint(A,w-1--w)--w,p);
  draw(pic,(0,y1)--(0,y2),p);
  draw(pic,(a,0)--(b,0),p);
  return shift(s)*pic;
};

picture frills(pen q)
{
  picture pic;
  pen p=linewidth(2)+q;
  
  path (0,7) -- (0,8) .. (1,)


  return pic;
};