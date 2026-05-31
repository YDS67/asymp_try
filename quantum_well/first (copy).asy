//texpreamble("\usepackage{mathtext}\usepackage[russian]{babel}");
//defaultpen(font("T2A","cmr","m","n"));
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
pen c_gray = rgb("#888888");
pen axes = black;
pen uaxis = blue;
pen incidence_col = purple;
pen refracted_col = darkgreen;
pen reflected_col = red;

real width = 8;
real height = 5;
real origin_position = 3;

pair origin = (4, origin_position);
path x_axis = (0, origin_position) -- (width, origin_position);
path u_axis = (4,0.5) -- (4,4.5);


pair impact_point = origin+(0,2.5);
path impact_normal = impact_point - (0.5*width,0) -- impact_point + (0.5*width,0);

pair incidence_point = impact_point - momentum_k1*(cos(incidence_angle_theta1), sin(incidence_angle_theta1));
path incidence_ray = incidence_point -- impact_point;

pair reflection_point = impact_point + momentum_k1*(-cos(incidence_angle_theta1), sin(incidence_angle_theta1));
path reflect_ray = impact_point -- reflection_point;

pair refraction_point = impact_point + momentum_k2*(cos(refraction_angle_theta2), sin(refraction_angle_theta2));
path refracted_ray = impact_point -- refraction_point;

// real nc_length_L = 4;
// real nc_width_w = 0.4;
// real period_a = 1;
// pair center = (width/2,height/2);
// path channel = box(center-(nc_length_L/2,nc_width_w),center+(nc_length_L/2,0));
// path barrier = box((width/2-nc_length_L/2,0),(width/2+nc_length_L/2,height));
// path source = box((0,0),center-(nc_length_L/2,-height/2));
// path drain = box(center+(nc_length_L/2,-height/2),(width,height));

fill(box((-1,-1),(width+1,height+1)), white);
draw(x_axis, arrow=Arrow(SimpleHead), axes);
label("$x$", (width, origin_position), align=E, axes);
draw(y_axis, arrow=Arrow(SimpleHead), axes);
label("$y$", origin+(0, height-origin_position), align=N, axes);
label("$0$", origin, align=NE, axes);
draw(u_axis, arrow=Arrow(SimpleHead), uaxis);
label("$U(x)$", origin-(0, origin_position), align=S, uaxis);
draw(u1_line, uaxis);
draw(u2_line, uaxis);
draw(energy_line, uaxis+dashed);
label("$U_1$", origin-(width/2, u1), align=S, uaxis);
label("$U_2$", origin+(width/2, -u2), align=S, uaxis);
label("$E$", origin+(0, -E_total), align=2E+2S, uaxis);

label("$m_1$", origin-(width/4, u1), align=2N, uaxis);
label("$m_2$", origin+(width/4, -u2), align=2N, uaxis);

draw(impact_normal, black+dashed);
draw(incidence_ray, arrow=Arrow(), incidence_col);
draw(reflect_ray, arrow=Arrow(), reflected_col);
draw(refracted_ray, arrow=Arrow(), refracted_col);

label("$\theta_1$", impact_point, align=2S+4W, incidence_col);
label("$\theta_1$", impact_point, align=2N+4W, reflected_col);
label("$\theta_2$", impact_point, align=1.5N+6E, refracted_col);

label("$\Psi=e^{i(k_{1x}x+k_{1y}y)}$", incidence_point, align=NW, incidence_col);

label("$\Psi=R e^{i(-k_{1x}x+k_{1y}y)}$", reflection_point, align=N, reflected_col);

label("$\Psi=T e^{i(k_{2x}x+k_{2y}y)}$", refraction_point, align=SE, refracted_col);


