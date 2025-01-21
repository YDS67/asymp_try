import graph;

texpreamble("\usepackage{mathtext}\usepackage{unicode-math}\usepackage[russian]{babel}\usepackage{fontspec}\setmainfont{Times New Roman}\setmathfont{Cambria Math}");

settings.tex = "lualatex";

defaultpen(fontsize(12pt)+linewidth(0.75));
settings.render = 8;

size(14cm, 9cm, IgnoreAspect);

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

// label("Средняя скорость электронов в направлении электрического поля", (0, 1.1 * ymax), align=N, black);

path sq = scale(4)*(E--N--W--S--cycle);
path cl = scale(3)*(E..N..W..S..cycle);
marker mark1 = marker(sq,blue+linewidth(1),FillDraw(white));
marker mark2 = marker(cl,red+linewidth(1),FillDraw(white));

draw(graph(x1, y1), blue+linewidth(2), mark1, legend = Label("$\langle v_x  ( E ) \rangle$ с учётом $Q$", black));
draw(graph(x2, y3*1.2), red+linewidth(2), mark2, legend = Label("$\langle v_x  ( E ) \rangle$ без учёта $Q$", black));
label(graphic("data/QuantPotential_map_10.png", "width=3cm"), (3,-0.7));
label("$Q(x,y)$", (2,-0.7), 3W);

label("$\displaystyle \frac{d\vec{v}}{dt} = \frac{e}{m^*} \vec{E} - \frac{1}{m^*} \nabla \left(U(\vec{r})-Q(\vec{r}) \right) - \frac{\vec{v}}{\tau}$", (-4.8,0.55), align=E);
label("$\displaystyle Q = \frac{\hbar^2}{2m} \frac{\Delta \sqrt{n}}{\sqrt{n}}$", (-4.8,0.05), align=E);

xaxis("Напряжённость электрического поля, кВ/см", BottomTop, LeftTicks);
yaxis("Скорость электронов, нм/фс", LeftRight, RightTicks(rotate(90)*Label()));

attach(legend(linelength = 20, vskip = 1.5, ymargin = 1, xmargin = 1), (-4.8,1.55), align=SE, UnFill);