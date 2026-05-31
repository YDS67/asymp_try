//texpreamble("\usepackage{mathtext}\usepackage[russian]{babel}");
//defaultpen(font("T2A","cmr","m","n"));
settings.tex = "pdflatex";
defaultpen(fontsize(16pt)+linewidth(1));

settings.render = 16;
unitsize(2cm);

//graphical parameters
pen c_yellow = rgb("#faedcb");
pen c_green = rgb("#c9e4de");
pen c_blue = rgb("#c6def1");
pen c_purple = rgb("#dbcdf0");
pen c_red = rgb("#f2c6de");
pen c_orange = rgb("#f7d9c4");
pen c_gray = rgb("#888888");
pen axes = black+dotted;
pen uaxis = blue+linewidth(1);
pen incidence_col = purple;
pen refracted_col = darkgreen;
pen reflected_col = red;

real width = 8;
real height = 5;
real origin_x = 3;
real origin_y = 3;
real impurity_x = 2;
real impurity_w = 0.15;
real impurity_h = 2.2;
real qw_w = 2;
real qw_h = 2.5;

pair origin = (origin_x, origin_y);
path z_axis = (0, origin_y) -- (width, origin_y);
path u_axis = (origin_x,0) -- (origin_x,height-0.5);
path potential = (0,origin_y) -- (impurity_x, origin_y) -- (impurity_x+0.5*impurity_w, origin_y-impurity_h) -- (impurity_x+impurity_w, origin_y) -- origin -- (origin_x, origin_y-qw_h) -- (origin_x + qw_w, origin_y-qw_h) -- (origin_x + qw_w, origin_y) -- (width-0.5, origin_y);

real marg = 0.5;

fill(box((-marg,-marg),(width+marg,height+marg)), white);
draw(z_axis, arrow=Arrow(SimpleHead), axes);
label("$z$", (width, origin_y), align=E);
draw(u_axis, arrow=Arrow(SimpleHead), axes);
label("$U(z)$", (origin_x,height-0.5), align=N);
draw(potential, uaxis);
label("$-A \delta(z+a)$", (impurity_x+0.5*impurity_w, origin_y), align=N);
label("$-B$", (origin_x, origin_y-qw_h), align=W);
label("$w$", (origin_x + qw_w, origin_y), align=N);
label("GaAs", (origin_x + 0.5*qw_w, origin_y-0.5*qw_h));
label("Al$_{0.3}$Ga$_{0.7}$As", (origin_x - 0.15*width, origin_y-0.5*qw_h), align=W);
label("Al$_{0.3}$Ga$_{0.7}$As", (origin_x + 0.35*width, origin_y-0.5*qw_h), align=E);
