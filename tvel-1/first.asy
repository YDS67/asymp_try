// texpreamble("\usepackage{mathtext}\usepackage[russian]{babel}");
// defaultpen(font("T2A","cmr","m","n"));
defaultpen(fontsize(14pt)+linewidth(0.6));

settings.render = 16;
unitsize(5cm);

//graphical parameters
pen p = black;

real dx = 0.02;
real U0 = 0.2;
pair top = (0,0.4);
pair left = (-1,0);
real x = left.x;
pair right = (1,0);
pair bottom = (0,-2);
path axis_x = left -- right;
path axis_y = bottom -- top;
path coulomb1 = (x, -U0/abs(x));
path coulomb2 = (-x, -U0/abs(x));
for(int j=1; j<1/dx; ++j) {
    x = left.x + dx*j;
    if (abs(x)>0.09) {
    coulomb1 = coulomb1 -- (x, -U0/abs(x));
    coulomb2 = coulomb2 -- (-x, -U0/abs(x));
    }
};


draw(axis_x, arrow = Arrow);
draw(axis_y, arrow = Arrow);
label("$x$", (1,0), align=E);
label("$U(x)$", top, align=N);

draw(coulomb1, blue);
draw(coulomb2, blue);

for(int j=1; j<5; ++j) {
    real En = -1.6/j^2;
    draw((-0.8, En) -- (0.8, En), red);
    label("$E_{"+string(j)+"}$", (0.8, En), align=E);
}