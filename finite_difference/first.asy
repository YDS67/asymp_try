texpreamble("\usepackage{mathtext}\usepackage[russian]{babel}");
defaultpen(font("T2A","cmr","m","n"));
defaultpen(fontsize(10pt));

//settings.outformat = "pdf";
settings.render = 16;
unitsize(5cm);

label("Метод конечных разностей", (1.5/2, 1), align=N, black);

draw((-.1,0) -- (1.5,0), arrow = Arrow);
draw((0,-.1) -- (0,1), arrow = Arrow);
label("$t$", (1.5,0), align=E);
label("$f$", (0,1), align=N);

real t1 = 0.2;
real t2 = 1.3;
real t12 = 0.5*(t1+t2);
real y1 = 0.3;
real y2 = 0.8;
real y12 = 0.7;
pair a = (t1, y1);
pair b = (t12, y12);
pair c = (t2, y2);
path functia = a .. b .. c;

path area = (t1,0) -- functia -- (t2,0) -- cycle;
path area1 = (t1,0) -- a -- (t2, y1) -- (t2,0) -- cycle;
path area2 = (t1,0) -- a -- c -- (t2,0) -- cycle;


fill(area, blue+opacity(0.2));
fill(area2, red+opacity(0.2));
fill(area1, purple+opacity(0.2));
draw(functia, heavyblue);
draw(a -- (t1,0), dashed);
label("$t_k$", (t1,0), align=S);
draw(c -- (t2,0), dashed);
label("$t_{k+1}$", (t2,0), align=S);
draw(b -- (t12,0), dashed+red);
label("$t_{k+1/2}$", (t12,0), align=S);
draw(a -- (0,y1), dotted);
label("$f_k$", (0,y1), align=W);
draw(c -- (0,y2), dotted);
label("$f_{k+1}$", (0,y2), align=W);
dot(a,black);
dot(b,red);
dot(c,black);

shipout(bbox(0.25cm,white));