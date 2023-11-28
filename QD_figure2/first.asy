texpreamble("\usepackage{mathtext}\usepackage[russian]{babel}");
defaultpen(font("T2A","cmr","m","n"));
defaultpen(fontsize(10pt));

settings.render = 10;
unitsize(x=3cm,y=3cm);

//graphical parameters
real opaque = 0.3;
real height = 2; // eV

path metal_surface_1 = (0,0) -- (0,height) -- (1,height) -- (1,0);
path metal_surface_2 = (2,0) -- (2,height) -- (3,height) -- (3,0);
path qd_surface = circle((1.5, 0.5*height), 0.4);
path dist = (1,0.1) -- (2,0.1);
path qd_size = (1.1,0.7*height+0.5) -- (1.9,0.7*height+0.5);

draw(metal_surface_1);
draw(metal_surface_2);
draw(qd_surface);

fill(metal_surface_1 -- cycle, blue+opacity(opaque));
fill(metal_surface_2 -- cycle, blue+opacity(opaque));
draw("d", dist, red, Arrows, align=N);
draw("a", qd_size, blue, Arrows, align=N);
label("$\tau_1$", (1.05, 0.5*height-0.5), align=S);
label("$\tau_2$", (1.95, 0.5*height-0.5), align=S);

dot("$\overline{e}$", (1.5, 0.5*height), purple, align=N);
dot("$\overline{e}$", (0.8, 0.5*height), black, align=N);
draw((0.75, 0.5*height) -- (0.55, 0.5*height), arrow=Arrow(TeXHead), black+dashed);

real x0 = 1.5;
real y0 = 0.5*height;
real radius1 = 0.15;
real radius2 = 0.5;
int no_of_angles = 10;

for(int i=0; i < no_of_angles; ++i) {
    real ang = 2*pi*i/no_of_angles;
    real x1 = x0+radius1*cos(ang);
    real x2 = x0+radius2*cos(ang);
    real y1 = y0+radius1*sin(ang);
    real y2 = y0+radius2*sin(ang);
    draw((x1,y1) -- (x2,y2), arrow=Arrow(TeXHead), purple+dashed);
}

