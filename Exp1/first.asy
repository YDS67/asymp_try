texpreamble("\usepackage{mathtext}\usepackage[russian]{babel}");
defaultpen(font("T2A","cmr","m","n"));
defaultpen(fontsize(10pt));

settings.outformat = "pdf";
unitsize(5cm);
// golden ratio
real phi = (sqrt(5)+1)/2;
// movement equations
// y = vy_0 * t - g * t^2 / 2
// t_f = 2 * vy_0 / g
// x_f = vx_0 * t_f
// y_max = v0^2 / 2 / g
// vy_f = vy_0 - g * t_f
real g = 9.81;
real vx_0 = 1.9;
real vy_0 = 3.8;
real v0 = sqrt(vx_0^2 + vy_0^2);
real t_f = 2 * vy_0 / g;
real x_f = vx_0 * t_f;
real y_max = vy_0^2 / 2 / g;
real t_mid = vy_0 / g;
real y_mid = vy_0 * t_mid - g * t_mid^2 / 2;
real x_mid = vx_0 * t_mid;
real vy_f = vy_0 - g * t_f;

label("Тело, брошенное под углом к горизонту", (phi / 2, 1), align=N, heavyblue);

draw((-.1,0) -- (phi,0), arrow = Arrow);
draw((0,-.1) -- (0,1), arrow = Arrow);
label("$x$", (phi,0), align=E);
label("$y$", (0,1), align=N);

draw((phi,1) * .9 -- (phi, .7) * .9, arrow = Arrow(SimpleHead), linewidth(.7));
label("$\vec{g}$", (phi, 1) * .9, align=N);

draw((0,0){vx_0, vy_0} .. (x_mid, y_max) .. {vx_0,vy_f}(x_f,0), blue);
fill((0,0){vx_0, vy_0} .. (x_mid, y_max) .. {vx_0,vy_f}(x_f,0) -- cycle, blue+opacity(.07));

draw((0,0) -- .15 * (vx_0, vy_0), arrow = Arrow(SimpleHead), red);
label("$\vec{v}_0$", .15 * (vx_0, vy_0), align=NW, red);

dot((x_mid, y_mid), purple);
label("$y_{max} - ?$", (x_mid, y_mid), align=N, purple);
