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
pen c_gray = rgb("#cccccc");
pen axes = black;
pen uaxis = blue;
pen incidence_col = darkgreen;
pen reflected_col = red;
pen refracted_col = purple;
pen channel_border = black;

real width = 8;
real height = 8;
real origin_position = 3;
real u1 = 1.5;
real u2 = 0.5;
real E_total = 2;
real incidence_angle_theta1 = pi/4;
//real refraction_angle_theta2 = pi/6;
real momentum_k1 = 0.4*width;
real momentum_k2 = 0.4*width;
real d_rays = 0.1;

pair origin = (4, origin_position);
path x_axis = (0, origin_position) -- (width, origin_position);
path y_axis = origin -- origin+(0, height-origin_position);
path u_axis = origin -- origin-(0, origin_position);
path u1_line = origin-(width/2, u1) -- origin-(0, u1);
path u2_line = origin-(0, u2) -- origin+(width/2, -u2);
path energy_line = origin-(width/2, E_total) -- origin+(width/2, -E_total);

pair impact_point = origin+(0,2.5);
path impact_normal = impact_point - (0.5*width,0) -- impact_point;

pair incidence_point = impact_point - momentum_k2*(1, 0);
path incidence_ray = shift((0,d_rays))*(incidence_point -- impact_point);

pair reflection_point = impact_point - momentum_k2*(1, 0);
path reflect_ray = shift((0,-d_rays))*(impact_point -- reflection_point);

pair refraction_point = impact_point + momentum_k2*(1, 0);
path refracted_ray = impact_point -- refraction_point;

real channel_w = 1;
path channel = box(impact_point-(width/2,channel_w),impact_point+(0,channel_w));
path forbidden = box(origin-(width/2,0), origin+(0, height-origin_position));

// real nc_length_L = 4;
// real nc_width_w = 0.4;
// real period_a = 1;
// pair center = (width/2,height/2);
// path channel = box(center-(nc_length_L/2,nc_width_w),center+(nc_length_L/2,0));
// path barrier = box((width/2-nc_length_L/2,0),(width/2+nc_length_L/2,height));
// path source = box((0,0),center-(nc_length_L/2,-height/2));
// path drain = box(center+(nc_length_L/2,-height/2),(width,height));

fill(box((-1,-1),(width+1,height+1)), white);
fill(forbidden, c_gray);
fill(channel, c_blue);
draw(impact_point-(0,channel_w)--impact_point-(width/2,channel_w), channel_border);
draw(impact_point+(0,channel_w)--impact_point-(width/2,-channel_w), channel_border);

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
label("$U_c$", origin-(width/2, u1), align=S, uaxis);
label("$U_d$", origin+(width/2, -u2), align=S, uaxis);
label("$E$", origin+(0, -E_total), align=2E+2S, uaxis);

label("$m_c$", origin-(width/4, u1), align=2N, uaxis);
label("$m_d$", origin+(width/4, -u2), align=2N, uaxis);

draw(incidence_ray, arrow=Arrow(), incidence_col);
draw(reflect_ray, arrow=Arrow(), reflected_col);
draw(refracted_ray, arrow=Arrow(), refracted_col);

label(minipage("$$\Psi=\sum_{l} I_l \phi_l(y) e^{i \beta_l x}$$", width=3), incidence_point, align=3N, incidence_col);

label(minipage("$$\Psi=\sum_{l} H_l \phi_l(y) e^{-i \beta_l x}$$", width=3), reflection_point, align=S, reflected_col);

label(minipage("$$\Psi=T(y) e^{ik_dx}$$", width=3), impact_point+0.3*(refraction_point-impact_point), align=N, refracted_col);

label(minipage("$$T(y)=\sum_{l} T_l \phi_l(y)$$", width=3), impact_point+width*0.1*(1,0), align=S, refracted_col);

