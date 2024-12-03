texpreamble("\usepackage{mathtext}\usepackage[russian]{babel}");
defaultpen(font("T2A","cmr","m","n"));
defaultpen(fontsize(10pt));

settings.render = 10;
unitsize(x=1.4cm,y=1.4cm);

//graphical parameters
real opaque = 0.4;
real width = 8;
real height = 5;
path border = box((0,0),(width,height));

real Rd = 2;
real theta = 30*pi/180;
real Rsph = Rd/sin(theta);
// Rsph-H = tan(pi/2-theta)*Rd
real H = Rsph-tan(pi/2-theta)*Rd;
real d = 0.05;
real w = 0.1;
real h = 2;
real angle1 = pi/2.2;

pair sphere_center = (0.5*width,h+H-Rsph);
pair droplet_center = (0.5*width, h);
pair droplet_end = droplet_center+(Rd,0);
pair droplet_start = droplet_center-(Rd,0);
pair droplet_top = droplet_center+(0,H);

path surface = box((0,0),(width,h));
path droplet = arc(sphere_center, Rsph, 90-180/pi*theta, 90+180/pi*theta, true) -- cycle;
path radius_sphere = sphere_center -- sphere_center+(0,Rsph);
path radius_droplet = droplet_center -- droplet_end;
path end_angle = droplet_start -- droplet_start+Rd*(1,tan(theta));
path droplet_height = droplet_center -- droplet_top;

fill(border, white);
fill(droplet, red+opacity(opaque));
fill(surface, blue+opacity(opaque));
dot(droplet_center);
dot(droplet_start);
//dot(sphere_center);
//draw(droplet_start -- droplet_top);
//draw(radius_sphere, arrow=Arrow(TeXHead));
draw("$R_d$", radius_droplet, arrow=Arrow(TeXHead), align = N);
draw("$H$", droplet_height, arrow=Arrow(TeXHead), align = E);
//draw("$c$", droplet_start -- droplet_top, align = N);
draw(droplet_start -- droplet_center);
//draw(droplet_start -- sphere_center);
//draw(droplet_center -- sphere_center);
//draw(arc(droplet_start, 0.4, 0, 180/pi*atan(H/Rd), true));
//label("$\alpha$", droplet_start, align = 5E+N);
//draw(arc(droplet_start, 0.4, 0, 180/pi*atan((Rsph-H)/Rd), false));
//label("$\beta$", droplet_start, align = 5E+S);
draw(end_angle, arrow=Arrow(TeXHead));
draw(arc(droplet_start, 0.4, 0, theta*180/pi, true));
label("$\theta$", droplet_start, align = 3*NE);
//draw(arc(droplet_start, 0.3, 0, -180/pi*(pi/2-theta), false));
//label("$\frac{\pi}{2}-\theta$", droplet_start, align = 4E+2S);

//draw(Label("$I_{11}=\frac{e}{\tau_{1}}f_{1}\left(E_{0}\right)$", align=3N, FillDraw(white, black)), I11, arrow=Arrow(DefaultHead));
//draw(Label("$I_{12}=-\frac{e}{\tau_{1}}n$", align=3N, FillDraw(white, black)), I12, arrow=Arrow(DefaultHead));
//draw(Label("$I_{21}=\frac{e}{\tau_{2}}n$", align=3N, FillDraw(white, black)), I21, arrow=Arrow(DefaultHead));
//draw(Label("$I_{22}=-\frac{e}{\tau_{2}}f_{2}\left(E_{0}\right)$", align=3N, FillDraw(white, black)), I22, arrow=Arrow(DefaultHead));

// draw("d", dist, red, Arrows, align=N);
// draw("a", qd_size, blue, Arrows, align=N);
// label("$\tau_1$", (1.1, 0.4*height-0.5), align=S);
// label("$\tau_2$", (1.9, 0.4*height-0.5), align=S);

// draw("$E_0$", (1.1, 0.3*height) -- (1.9, 0.3*height), purple+dashed, align=N);
// label("$n$", (1.1, 0.3*height) -- (1.9, 0.3*height), align=S);

// dot("$\overline{e}$", (0.5, 0.3*height), black, align=N);
// draw((0.55, 0.3*height) -- (0.75, 0.3*height), arrow=Arrow(SimpleHead), black+dashed);
// dot("$\overline{e}$", (2.2, 0.3*height), black, align=N);
// draw((2.25, 0.3*height) -- (2.45, 0.3*height), arrow=Arrow(SimpleHead), black+dashed);

