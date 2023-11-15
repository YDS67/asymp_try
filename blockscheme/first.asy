import roundedpath;

settings.render = 16;
settings.outformat = "pdf";
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

//box 1
pen p1 = royalblue+pb;
path box1 = box((0,0),(w,h1));
box1 = roundedpath(box1,rc);
label("(b)",(w,h1),align=3SW);

//box 2
pen p2 = heavygreen+pb;
path box2 = box((0,y1),(w,y2));
box2 = roundedpath(box2,rc);
label("(a)",(w,y2),align=3SW);

draw(box1, p1);
draw(box2, p2);

draw(Label("Trim flights"),box,0.5(c1+c2),xmargin=0.35*w3*100,ymargin=d*100,pl);
draw(Label("Parameter estimation"),box,0.5(c3+c4),xmargin=0.065*w3*100,ymargin=d*150,pl);
