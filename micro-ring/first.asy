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
real h = 4.5;
pair ring_center = (3,4-ring_radius);

fill(box((0,0),(6,5)),white);
draw((0.5,h)--(0.5+wg_length,h));
draw((0.5,h-wg_width)--(0.5+wg_length,h-wg_width));
draw(circle(ring_center,ring_radius));
draw(circle(ring_center,ring_radius+wg_width));

draw("$\vec{E}_{11},\vec{H}_{11}$",(0.6,h-0.5*wg_width)--(1.6,h-0.5*wg_width), red, arrow=Arrow(SimpleHead), align=2S);
draw("$\vec{E}_{12},\vec{H}_{12}$",(4.3,h-0.5*wg_width)--(5.3,h-0.5*wg_width), blue, arrow=Arrow(SimpleHead), align=2S);

//draw("$B_0$",arc((3,4-ring_radius),ring_radius+0.5*wg_width,140,110), blue, arrow=Arrow(SimpleHead), align=NW);
//draw("$B$",arc((3,4-ring_radius),ring_radius+0.5*wg_width,80,50), blue, arrow=Arrow(SimpleHead), align=N+2E);

real d = 0.8;

draw((0.5,h-2*ring_radius-d)--(0.5+wg_length,h-2*ring_radius-d));
draw((0.5,h-wg_width-2*ring_radius-d)--(0.5+wg_length,h-wg_width-2*ring_radius-d));
draw("$\vec{E}_{21},\vec{H}_{21}$",(1.6,h-2*ring_radius-d-0.5*wg_width)--(0.6,h-2*ring_radius-d-0.5*wg_width), blue, arrow=Arrow(SimpleHead), align=2S);
draw("$\vec{E}_{22},\vec{H}_{22}$",(4.3,h-2*ring_radius-d-0.5*wg_width)--(5.3,h-2*ring_radius-d-0.5*wg_width), blue, arrow=Arrow(SimpleHead), align=2S);

dot(ring_center);

draw(ring_center -- ring_center+(0,2.2), arrow=Arrow);
draw(ring_center -- ring_center+(2.7,0), arrow=Arrow);
label("$x$", ring_center+(0,2.2), align=N);
label("$z$", ring_center+(2.7,0), align=E);
label("$y$", ring_center, align=2W);
draw(circle(ring_center,0.12));