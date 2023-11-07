import graph;

defaultpen(fontsize(8pt));
settings.render = 16;

size(8cm, 6cm, IgnoreAspect);

file in1 = input("data/diffusion_results_FD.dat").line();
real[][] dat1 = in1;
dat1 = transpose(dat1);

file in2 = input("data/diffusion_results_RW.dat").line();
real[][] dat2 = in2;
dat2 = transpose(dat2);

real[] x1 = dat1[0];
real[] y1 = dat1[1];
real[] y2 = dat1[2];

real[] x2 = dat2[0];
real[] y3 = dat2[1];

real ymax = max(y1);

label("Random walk / diffusion", (0, 1.1 * ymax), align=N, black);

pen p = linewidth(1);
marker mark = marker(scale(1)*unitcircle,FillDraw(black));

draw(graph(x1, y1), blue+p, 
    legend = Label("$ \displaystyle N = \frac{N_0}{\sqrt{4 \pi Dt}} \exp \left(-\frac{z^2}{4Dt} \right)$", black));
fill(graph(x1,y1) -- cycle, blue+opacity(0.07));
draw(graph(x1, y2), red+dashed+p, legend = Label("Finite difference", black));
draw(graph(x2, y3), opacity(0), mark, legend = "Random walk");

xaxis("Distance, cm",BottomTop,LeftTicks);
yaxis("Number of particles",LeftRight,RightTicks(rotate(90)*Label()));

attach(legend(linelength = 20, vskip = 0.7, ymargin = 1, xmargin = 1), 
    (point(S).x,truepoint(S).y), 5S, UnFill);