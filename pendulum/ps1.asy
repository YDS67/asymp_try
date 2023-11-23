import geometry;

texpreamble("\usepackage{mathtext}\usepackage[russian]{babel}");
defaultpen(font("T2A","cmr","m","n"));
defaultpen(fontsize(12pt));

settings.render = 16;
unitsize(5cm);

real pi = radians(180);
real phi_1 = 0.15 * pi;
real phi_2 = 0.25 * pi;
real l = 0.8;
real rp = 0.08;
real bh = 0.02;
real bw = 0.75;
real bx01 = -bw;
real bx02 = bw;
real bl = 0.4;
real bangle = - 0.2 * pi;
real bx_1 = bx01 + bl * sin(bangle);
real by_1 = 0 - bl * cos(bangle);
real bx_2 = bx02 + bl * sin(bangle);
real by_2 = 0 - bl * cos(bangle);
real bx_c = 0.5 * (bx_1 + bx_2);
real by_c = 0.5 * (by_1 + by_2);
real x_1 = -0.4;
real x_2 = 0.4;
// pendulum coordinates
real px0_1 = bx_c + x_1;
real py0_1 = by_c;
real px0_2 = bx_c + x_2;
real py0_2 = by_c;
real px_1 = px0_1 + l * sin(phi_1);
real py_1 = py0_1 - l * cos(phi_1);
real px_2 = px0_2 + l * sin(phi_2);
real py_2 = py0_2 - l * cos(phi_2);
// angle arc
real arc_r = 0.15;

draw((-1.1,0) -- (1,0), arrow = Arrow);
draw((0,-1.3) -- (0,0.2), arrow = Arrow);
label("$x$", (1,0), align=E);
label("$y$", (0,0.2), align=N);

pen rod_style = linewidth(2);
pen pend_line_style = linewidth(1);

draw("$h$", (bx01, 0) -- (bx_1, by_1), rod_style, align=NW);
draw((bx02, 0) -- (bx_2, by_2), rod_style);
draw((bx02, 0) -- (bx02, -bl), dashed);
draw("$w$", (bx01, bh)--(0, bh), red, Bars, Arrows, align=N);
draw(arc((bx02, 0), arc_r, -90 + Degrees(bangle), -90, true));
label("$\theta$", (bx02 + 1.1 * arc_r * sin(bangle), - 1.1 * arc_r * cos(bangle)), align = SE);

path base0 = box((bx_1, by_1 + bh), (bx_2, by_2 - bh));
path base1 = circle((px0_1, py0_1), bh); 
path base2 = circle((px0_2, py0_2), bh); 

path rod1 = (px0_1, py0_1) -- (px_1, py_1);
path rod2 = (px0_2, py0_2) -- (px_2, py_2);
path pendulum1 = circle((px_1, py_1), rp);
path pendulum2 = circle((px_2, py_2), rp);

draw(base0);
fill(base0, lightgray);
fill(circle((bx_c, by_c), bh), purple);
label("$X, Y$", (bx_c, by_c + bh), align = N);
label("$M$", (bx_c, by_c - bh), align = SW, purple);
draw("$a$", (bx_c, by_c - 2.2 * bh)--(px0_2, by_c - 2.2 * bh), red, Bars, Arrows, align=S);

fill(base1, black);
fill(base2, black);
label("$x_1, y_1$", (px_1 - rp, py_1), align = SW);
label("$x_2, y_2$", (px_2 - rp, py_2), align = SW);

draw("$l$", rod1, rod_style, align = NE);
draw("$l$", rod2, rod_style, align = NE);

draw((px0_1, py0_1) -- (px0_1, py0_1-0.8*l), dashed);
draw(arc((px0_1, py0_1), arc_r, -90 + Degrees(phi_1), -90, false));
draw((px0_2, py0_2) -- (px0_2, py0_2-0.8*l), dashed);
draw(arc((px0_2, py0_2), arc_r, -90 + Degrees(phi_2), -90, false));
label("$\varphi_1$", (px0_1 + 1.3 * arc_r * sin(0.5 * phi_1), py0_1 - 1.2 * arc_r * cos(0.5 * phi_1)), align = S);
label("$\varphi_2$", (px0_2 + 1.2 * arc_r * sin(0.5 * phi_2), py0_2 - 1.1 * arc_r * cos(0.5 * phi_2)), align = S);

draw(pendulum1, pend_line_style);
draw(pendulum2, pend_line_style);
fill(pendulum1, lightblue);
fill(pendulum2, lightred);
label("$m$", (px_1, py_1));
label("$m$", (px_2, py_2));
