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
pen c_gray = rgb("#cccccc");
pen axes = black;
pen sample = blue;
pen fields = purple;
pen electron = red;
pen hole = deepgreen;

// frame size
real width = 8;
real height = 6;

fill(box((0,0),(width,height)), white);

// axes
real d = 0.5;
real y_length = width*0.7;
pair origin = (d,d);
real angle = pi/3;
pair dir = (cos(angle),sin(angle));
pair x_end = (width-d,d);
pair y_end = origin+y_length*dir;
pair z_end = (d,height-d);

draw(origin -- x_end, arrow=Arrow(), axes);
draw(origin -- y_end, arrow=Arrow(), axes);
draw(origin -- z_end, arrow=Arrow(), axes);
label("$x$", x_end, align=E, axes);
label("$y$", y_end, align=NE, axes);
label("$z$", z_end, align=N, axes);

// sample

real a_length = width*0.5;
real b_depth = width*0.3;
real c_height = width*0.1;

path face_bottom = origin -- origin+(a_length,0) -- origin+(a_length,0)+b_depth*dir -- origin+b_depth*dir -- cycle;
path face_top = shift((0,c_height))*face_bottom;
path face_forward = origin -- origin+(a_length,0) -- origin+(a_length,c_height) -- origin + (0,c_height) -- cycle;
path face_back = shift(b_depth*dir)*face_forward;

fill(face_bottom, c_blue+opacity(0.5));
fill(face_back, c_blue+opacity(0.5));
draw(face_bottom, sample);
draw(face_top, sample);
draw(face_forward, sample);
draw(face_back, sample);
fill(face_top, c_blue+opacity(0.5));
fill(face_forward, c_blue+opacity(0.5));
label("$a$", origin+0.5*(a_length,0), align=S, sample);
label("$b$", origin+0.75*b_depth*dir, align=W, sample);
label("$c$", origin+0.5*(0,c_height), align=W, sample);

// fields

real field_line_length = width*0.2;
pair Ex_origin = origin + (a_length,0) + (1.5d,d);
pair Ey_origin = origin + (a_length,0) + (1.5d,d) + d*dir;
pair B_origin = origin + (1.5d,0.5*height);

draw(Ex_origin -- Ex_origin+(field_line_length, 0), arrow=Arrow(SimpleHead), fields);
label("$E_x$", Ex_origin+(field_line_length, 0), align=NE, fields);
draw(Ey_origin -- Ey_origin+field_line_length*dir, arrow=Arrow(SimpleHead), fields);
label("$E_y$", Ey_origin+field_line_length*dir, align=E, fields);
draw(B_origin -- B_origin+(0, field_line_length), arrow=Arrow(SimpleHead), fields);
label("$\vec{B}$", B_origin+(0, field_line_length), align=E, fields);

// electron 

pair electron_position = origin + 0.8*(a_length,0) + 0.75*b_depth*dir;
real electron_path_length = a_length*0.3;
real curvature_radius = 2*electron_path_length;
real arc_angle = 2*asin(electron_path_length/curvature_radius/2)/pi*180;

draw(electron_position -- electron_position - electron_path_length*(1,0), arrow=Arrow(SimpleHead), electron);
draw(arc(electron_position-curvature_radius*(0,1), curvature_radius, 90, 90+arc_angle), arrow=Arrow(SimpleHead), electron+dashed);
dot(electron_position, electron);
label("$\bar{e}$", electron_position, align=N, electron);

// hole

pair hole_position = origin + 0.1*(a_length,0) + 0.75*b_depth*dir;
real hole_path_length = electron_path_length;
real curvature_radius = 2*hole_path_length;
real arc_angle = 2*asin(hole_path_length/curvature_radius/2)/pi*180;

draw(hole_position -- hole_position + hole_path_length*(1,0), arrow=Arrow(SimpleHead), hole);
draw(arc(hole_position-curvature_radius*(0,1), curvature_radius, 90, 90-arc_angle), arrow=Arrow(SimpleHead), hole+dashed);
dot(hole_position, hole);
label("$h$", hole_position, align=N, hole);