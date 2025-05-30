//texpreamble("\usepackage{mathtext}\usepackage[russian]{babel}");
//defaultpen(font("T2A","cmr","m","n"));
defaultpen(fontsize(10pt));

settings.render = 16;
unitsize(2cm);

//graphical parameters
pen p = black;

path device = box((1,0),(2,1));
path line1 = (0,0.9) -- (1,0.9);
path line2 = (0,0.1) -- (1,0.1);
path line3 = (2,0.1) -- (3,0.1);
path line4 = (2,0.9) -- (3,0.9);
path u1 = (0.1,0.85) -- (0.1,0.15);
path u2 = (2.9,0.85) -- (2.9,0.15);
path i1 = (0.3,0.8) -- (0.9,0.8);
path i11 = (0.9,1) -- (0.3,1);
path i2 = (2.1,0.8) -- (2.7,0.8);
path i21 = (2.7,0.2) -- (2.1,0.2);
path i1_2 = (0.9,0.2) -- (0.3,0.2);
path i2_2 = (2.1,0) -- (2.7,0);

fill(device,p+paleblue);
draw(device,p);
draw(line1,p);
draw(line2,p);
draw(line3,p);
draw(line4,p);

fill(circle((0,0.9),0.04),black);
fill(circle((0,0.1),0.04),black);
fill(circle((3,0.9),0.04),black);
fill(circle((3,0.1),0.04),black);

draw("$U_1$", u1, p, arrow = Arrow, align=W);
draw("$U_2$", u2, p, arrow = Arrow, align=E);
draw("$I_1$", i1, p+blue, arrow = Arrow, align=S);
draw("$I_1^{\prime}$", i11, p+blue, arrow = Arrow, align=N);
draw("$I_2$", i2, p+blue, arrow = Arrow, align=S);
draw("$I_2^{\prime}$", i21, p+red, arrow = Arrow, align=N);
draw("$I_1$", i1_2, p+red, arrow = Arrow, align=N);
draw("$I_2$", i2_2, p+red, arrow = Arrow, align=S);

label(minipage("$$\left(\begin{array}{c}
I_{1}^{\prime}\\
I_{2}
\end{array}\right)=\left(\begin{array}{cc}
S_{11} & S_{12}\\
S_{21} & S_{22}
\end{array}\right)\left(\begin{array}{c}
I_{1}\\
I_{2}^{\prime}
\end{array}\right)$$", 3), (0.2,-0.2), align=S);