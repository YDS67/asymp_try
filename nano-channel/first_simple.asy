//texpreamble("\usepackage{mathtext}\usepackage[russian]{babel}");
//defaultpen(font("T2A","cmr","m","n"));
settings.tex = "pdflatex";
defaultpen(fontsize(14pt)+linewidth(1));

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
pen axes = blue;

real width = 8;
real height = 5;
real nc_length_L = 4;
real nc_width_w = 0.4;
real period_a = 1;
pair center = (width/2,height/2);
path channel = box(center-(nc_length_L/2,nc_width_w),center+(nc_length_L/2,0));
path barrier = box((width/2-nc_length_L/2,0),(width/2+nc_length_L/2,height));
path source = box((0,0),center-(nc_length_L/2,-height/2));
path drain = box(center+(nc_length_L/2,-height/2),(width,height));

fill(box((0,0),(width,height)),white);
fill(barrier,c_yellow);
fill(channel,c_green);
draw(channel);
label("Channel: $U_c=0$", center+(0,period_a), align=S);
label("Barrier: $U_b>0$", center+(0,period_a), align=2N);
label("Source: $U_s=0$", (center.x/2-nc_length_L/4,height*0.75), align=N);
label("Drain: $U_d=0$", (3*center.x/2+nc_length_L/4,height*0.75), align=N);
label("$\Psi_s$", center/2-(nc_length_L/4,0), align=N);
label("$\Psi_d$", (3*center.x/2+nc_length_L/4,height*0.25), align=N);

fill(shift((0,period_a))*channel,c_green);
draw(shift((0,period_a))*channel);
fill(shift((0,2*period_a))*channel,c_green);
draw(shift((0,2*period_a))*channel);
fill(shift((0,-period_a))*channel,c_green);
draw(shift((0,-period_a))*channel);
fill(shift((0,-2*period_a))*channel,c_green);
draw(shift((0,-2*period_a))*channel);
fill(source,c_red);
draw(center-(nc_length_L/2,-height/2)--center-(nc_length_L/2,height/2));
fill(drain,c_purple);
draw(center+(nc_length_L/2,-height/2)--center+(nc_length_L/2,height/2));

draw(brace(center-(nc_length_L/2,nc_width_w+period_a), center-(-nc_length_L/2,nc_width_w+period_a),-0.2),red);
label("$L$",center-(0,period_a+nc_width_w), red, align=3S);

draw(brace(center-(nc_length_L/2,0), center-(nc_length_L/2,-period_a),0.2),red);
label("$a$",center-(nc_length_L/2,-period_a/2), red, align=3W);
draw(center-(nc_length_L/4,nc_width_w)--center-(nc_length_L/4,0), arrow=Arrows(SimpleHead), red);
label("$w$",center-(nc_length_L/4,nc_width_w/2), red, align=2W);

draw(center-(nc_length_L/2,nc_width_w) -- center+(width/2.3,-nc_width_w), arrow=Arrow(SimpleHead), axes);
draw(center-(nc_length_L/2,height/2.1) -- center-(nc_length_L/2,0)+(0,height/2.1), arrow=Arrow(SimpleHead), axes);
label("$x$", center+(width/2.3,-nc_width_w), align=N, axes);
label("$y$", center-(nc_length_L/2,0)+(0,height/2.1), align=E, axes);
label("$0$", center-(nc_length_L/2,nc_width_w), align=2W);
//label("$y$", center-(nc_length_L/2,nc_width_w), align=2S+E);
dot(center-(nc_length_L/2,nc_width_w), blue);
//draw(circle(center-(nc_length_L/2,nc_width_w),0.12), c_gray);


