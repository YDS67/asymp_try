texpreamble("\usepackage{mathtext}\usepackage[russian]{babel}");
defaultpen(font("T2A","cmr","m","n"));
defaultpen(fontsize(10pt));

settings.render = 10;
unitsize(x=3cm,y=3cm);

//graphical parameters
real opaque = 0.3;
real height = 2; // eV

path metal_surface_1 = (0,0) -- (0,1*height) -- (1,1*height) -- (1,0);
path metal_surface_2 = (2,0) -- (2,1*height) -- (3,1*height) -- (3,0);
path qd_surface = circle((1.5, 0.3*height), 0.4);
path dist = (1,0.1) -- (2,0.1);
path qd_size = (1.1,0.7*height+0.5) -- (1.9,0.7*height+0.5);
path I11 = (0.8, 0.6*height) -- (1.2, 0.6*height);
path I12 = (1.2, 0.8*height) -- (0.8, 0.8*height);
path I21 = (1.8, 0.6*height) -- (2.2, 0.6*height);
path I22 = (2.2, 0.8*height) -- (1.8, 0.8*height);

draw(metal_surface_1);
draw(metal_surface_2);
draw(qd_surface);

fill(metal_surface_1 -- cycle, blue+opacity(opaque));
fill(metal_surface_2 -- cycle, blue+opacity(opaque));

draw(Label("$I_{11}=\frac{e}{\tau_{1}}f_{1}\left(E_{0}\right)$", align=3N, FillDraw(white, black)), I11, arrow=Arrow(DefaultHead));
draw(Label("$I_{12}=-\frac{e}{\tau_{1}}n$", align=3N, FillDraw(white, black)), I12, arrow=Arrow(DefaultHead));
draw(Label("$I_{21}=\frac{e}{\tau_{2}}n$", align=3N, FillDraw(white, black)), I21, arrow=Arrow(DefaultHead));
draw(Label("$I_{22}=-\frac{e}{\tau_{2}}f_{2}\left(E_{0}\right)$", align=3N, FillDraw(white, black)), I22, arrow=Arrow(DefaultHead));

//draw("d", dist, red, Arrows, align=N);
//draw("a", qd_size, blue, Arrows, align=N);
label("$\tau_1$", (1.1, 0.4*height-0.5), align=S);
label("$\tau_2$", (1.9, 0.4*height-0.5), align=S);

draw("$E_0$", (1.1, 0.3*height) -- (1.9, 0.3*height), purple+dashed, align=N);
label("$n$", (1.1, 0.3*height) -- (1.9, 0.3*height), align=S);

dot("$\overline{e}$", (0.5, 0.3*height), black, align=N);
draw((0.55, 0.3*height) -- (0.75, 0.3*height), arrow=Arrow(SimpleHead), black+dashed);
dot("$\overline{e}$", (2.2, 0.3*height), black, align=N);
draw((2.25, 0.3*height) -- (2.45, 0.3*height), arrow=Arrow(SimpleHead), black+dashed);

real x0 = 1.5;
real y0 = 0.5*height;
real radius1 = 0.15;
real radius2 = 0.5;
int no_of_angles = 10;

