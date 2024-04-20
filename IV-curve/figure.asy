import graph;
texpreamble("\usepackage{mathtext}\usepackage[russian]{babel}");
defaultpen(font("T2A","cmr","m","n"));
settings.tex = "pdflatex";

defaultpen(fontsize(8pt));
settings.render = 16;

size(9cm, 6cm, IgnoreAspect);

file in1 = input("data/IV_curve_10.dat").line();
real[][] dat1 = in1;
dat1 = transpose(dat1);

file in2 = input("data/IV_curve_100.dat").line();
real[][] dat2 = in2;
dat2 = transpose(dat2);

real[] x1 = dat1[0];
real[] y1 = dat1[1];
real[] y2 = dat1[2];

real[] x2 = dat2[0];
real[] y3 = dat2[1];
real[] y4 = dat2[2];

real ymax = max(y1);

// label("Средняя скорость электронов в направлении электрического поля", (0, 1.1 * ymax), align=N, black);

pen p = linewidth(1);
marker mark1 = marker(scale(1.5)*unitcircle,blue,FillDraw(blue));
marker mark2 = marker(scale(1.5)*unitcircle,red,FillDraw(white));

draw(graph(x1, y1), blue+p, mark1, legend = Label("$\langle v_x  ( E ) \rangle$ with $Q$", black));
draw(graph(x2, y3), red+p, mark2, legend = Label("$\langle v_x  ( E ) \rangle$ without $Q$", black));
label(graphic("data/QuantPotential_map_10.png", "width=2cm"), (3,-0.6));
label("$Q(x,y)$", (2,-0.6), 3W);

label("$\displaystyle \frac{d\vec{v}}{dt} = \frac{e}{m^*} \vec{E} - \frac{1}{m^*} \nabla \left(U(\vec{r})-Q(\vec{r}) \right) - \frac{\vec{v}}{\tau}$", (-4.8,0.55), align=E);
label("$\displaystyle Q = \frac{\hbar^2}{2m} \frac{\Delta \sqrt{n}}{\sqrt{n}}$", (-4.8,0.05), align=E);

xaxis("Напряжённость электрического поля, кВ/см",BottomTop,LeftTicks);
yaxis("Скорость электронов, нм/фс",LeftRight,RightTicks(rotate(90)*Label()));

attach(legend(linelength = 20, vskip = 1.5, ymargin = 1, xmargin = 1), 
    (-4.8,1.35), align=SE, UnFill);