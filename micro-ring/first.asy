//texpreamble("\usepackage{mathtext}\usepackage[russian]{babel}");
//defaultpen(font("T2A","cmr","m","n"));
defaultpen(fontsize(10pt)+linewidth(0.6));

settings.render = 16;
unitsize(1cm);

//graphical parameters
pen p = black;

real wg_length = 5;
real wg_width = 0.2;
real ring_radius = 1.5;

fill(box((0,0),(6,5)),white);
draw((0.5,4.5)--(0.5+wg_length,4.5));
draw((0.5,4.5-wg_width)--(0.5+wg_length,4.5-wg_width));
draw(circle((3,4-ring_radius),ring_radius));
draw(circle((3,4-ring_radius),ring_radius+wg_width));
//draw(circle((3,4-ring_radius),ring_radius+0.5*wg_width),dashed);

draw("$A_0$",(0.6,4.5-0.5*wg_width)--(1.6,4.5-0.5*wg_width), red, arrow=Arrow(SimpleHead), align=2N);
draw("$A$",(4,4.5-0.5*wg_width)--(5,4.5-0.5*wg_width), red, arrow=Arrow(SimpleHead), align=2N);

draw("$B_0$",arc((3,4-ring_radius),ring_radius+0.5*wg_width,140,110), blue, arrow=Arrow(SimpleHead), align=NW);
draw("$B$",arc((3,4-ring_radius),ring_radius+0.5*wg_width,80,50), blue, arrow=Arrow(SimpleHead), align=N+2E);

// fill(circle((0,0.9),0.04),black);
// fill(circle((0,0.1),0.04),black);
// fill(circle((3,0.9),0.04),black);
// fill(circle((3,0.1),0.04),black);

// draw("$U_1$", u1, p, arrow = Arrow, align=W);
// draw("$U_2$", u2, p, arrow = Arrow, align=E);
// draw("$I_1$", i1, p, arrow = Arrow, align=S);
// draw("$I_1^{\prime}$", i11, p, arrow = Arrow, align=N);
// draw("$I_2$", i2, p, arrow = Arrow, align=S);
// draw("$I_2^{\prime}$", i21, p, arrow = Arrow, align=N);