import roundedpath;
import flowchart;

texpreamble("\usepackage{bm}");
settings.render = 16;
defaultpen(fontsize(7pt)+NewCenturySchoolBook()+linewidth(0.3));
unitsize(5cm);

pen pb = linetype(new real[] {4,4})+linewidth(0.6);
pen pl = black+linewidth(0.3);
real rc = 0.06;
real d = 0.02;
real w = 1.6;
real h1 = 1;
real h2 = 0.3;
real y1 = h1+d;
real y2 = y1+h2;
real w3 = 0.35w;
real h3 = 0.3*h2;
real d3 = 0.04;
pair c1 = (d3,y1+d3);
pair c2 = (d3+w3,y1+d3+h3);
pair c3 = (d3,y1+h3+2d3);
pair c4 = (d3+w3,y1+2h3+2d3);

block block1 = rectangle(Label("Trim flights"),0.5(c1+c2));
block block2 = rectangle(Label("Parameter estimation"),0.5(c3+c4));
block block3 = rectangle(Label("Altitude controller"),(0.4w,0.9h1));
block block4 = rectangle(Label(minipage("\centering Horizontal \\ Translational \\ Controller",1.6cm)),(0.35*w,0.6*h1));
block block5 = rectangle(Label("Attitude controller"),(0.7w,0.6h1));
block block5a = rectangle("A",(0.8w,0.6h1));
block block5b = rectangle("A",(0.65w,0.6h1));
block block5c = rectangle("A",(0.75w,0.6h1));
block block6 = rectangle(Label("Dynamics"),(0.9w,0.4h1));
block block6a = rectangle("Dy",(0.94w,0.4h1));
block block7 = rectangle(Label("IMU"),(0.65w,0.4h1));
block block8 = rectangle(Label(minipage("\centering Real Time \\ Low-pass filter",2cm)),(0.65*w,0.15*h1));
block node1 = block((0.9w,0.6h1));
block node2 = block((0.9w,0.75h1));
block node3 = block((0.05w,0.75h1));
block node3a = block((0.1w,0.75h1));
pair c1 = (0.25w,0.3h1);
real r1 = 1.5d3;
path circle1 = arc(c1,r1,-225,-135)--arc(c1,r1,-135,-45)--arc(c1,r1,-45,45)--arc(c1,r1,-135,-45)--arc(c1,r1,135,-45);
block node4 = circle("A",c1);
block node5 = block((0.94w,0.3h1));
block node6 = block(c1-(0,0.2h1));

//box 1
pen p1 = royalblue+pb;
path box1 = box((0,0),(w+0.05,h1));
box1 = roundedpath(box1,rc);
label("(b)",(w,h1),align=3SW);

//box 2
pen p2 = heavygreen+pb;
path box2 = box((0,y1),(w+0.05,y2));
box2 = roundedpath(box2,rc);
label("(a)",(w,y2),align=3SW);

draw(box1, p1);
draw(box2, p2);

draw(block1);
draw(block2);
draw(block3);
draw(block4);
draw(block5);
draw(block6);
draw(block7);
draw(block8);
draw(circle1);

add(new void(picture pic, transform t) {
    pen pc1 = linetype(new real[] {8,8});
    blockconnector operator --=blockconnector(pic,t,pc1);
    block1--Label("$(\bm{n}^*,\epsilon)$",align=2N+5W)--Right--Down--Arrow--block5;
    block2--Label("$\phi$",align=2N+5W)--Right--Down--Arrow--block5a;
    blockconnector operator --=blockconnector(pic,t);
    block3--Right--Down--node1--Left--block5;
    node2--Right--Down--Label("$f_{m,i}$",align=E)--Arrow--block6a;
    block6a--Down--Left--Label("$\bm{p}$",align=N+2W)--Arrow--block8;
    block4--Right--Label("$\bm{n}^d$",align=N)--Arrow--block5;
    block8--Left--Up--Left--Arrow--node4;
    node4--Left--Up--node3--Right--node3a;
    node3a--Down--Right--Label("$(e_{px},e_{py})$",align=S+0.4E)--Arrow--block4;
    node3a--Up--Right--Label("$e_{pz}$",align=N+E)--Arrow--block3;
    block7--Up--Label("$\bm{\omega}$",align=W+S)--Arrow--block5b;
    node5--Left--Up--Arrow--Label("$\bm{R}_b^w$",align=12N+2E)--block5c;
    node6--Up--Label("$\bm{p}^d$",align=E)--Arrow--node4;
  });