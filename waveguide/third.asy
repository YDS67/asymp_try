//texpreamble("\usepackage{mathtext}\usepackage[russian]{babel}");
//defaultpen(font("T2A","cmr","m","n"));
settings.tex = "pdflatex";
defaultpen(fontsize(14pt)+linewidth(0.8));

settings.render = 16;
unitsize(1cm);

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
pen incidence_col = purple;
pen refracted_col = darkgreen;
pen reflected_col = red;
pen channel_border = black;

real width = 14;
real height = 8;
real origin_position = 0;
real origin_position_x = 6;
real u1 = 1.5;
real u2 = 1;
real E_total = 1.5;
real incidence_angle_theta1 = pi/4;

real channel_w = 2;
real channel_l = 8;

real refraction_angle_theta2 = pi/6;
real momentum_k1 = 0.5*origin_position_x/cos(incidence_angle_theta1);
real momentum_k2 = 0.5*origin_position_x/cos(incidence_angle_theta1);

real momentum_k3 = channel_w/sin(refraction_angle_theta2);

pair origin = (origin_position_x, origin_position);
path x_axis = (0, origin_position) -- (width, origin_position);
path y_axis = origin -- origin+(0, height-origin_position);

pair impact_point = origin+(0,height/2);
path impact_normal = impact_point - (origin_position_x,0) -- impact_point + (channel_l, 0);

pair incidence_point = impact_point - momentum_k1*(cos(incidence_angle_theta1), sin(incidence_angle_theta1));
path incidence_ray = incidence_point -- impact_point;

pair reflection_point = impact_point + momentum_k1*(-cos(incidence_angle_theta1), sin(incidence_angle_theta1));
path reflect_ray = impact_point -- reflection_point;

pair refraction_point = impact_point + momentum_k3*(cos(refraction_angle_theta2), sin(refraction_angle_theta2));
path refracted_ray = impact_point -- refraction_point;
path refracted_ray2 = refraction_point -- refraction_point + 1.3*momentum_k3*(cos(refraction_angle_theta2), -sin(refraction_angle_theta2));;

path channel = box(impact_point-(0,channel_w),impact_point+(channel_l,channel_w));
path forbidden = box(origin, (width, height));

fill(box((-1,-1),(width+1,height+1)), white);
fill(forbidden, c_gray);
fill(channel, c_blue);
draw(impact_point-(0,channel_w)--impact_point+(channel_l,-channel_w), channel_border);
draw(impact_point+(0,channel_w)--impact_point+(channel_l,channel_w), channel_border);

draw(x_axis, arrow=Arrow(SimpleHead), axes);
label("$x$", (width, origin_position), align=E, axes);
draw(y_axis, arrow=Arrow(SimpleHead), axes);
label("$y$", origin+(0, height-origin_position), align=N, axes);
label("$0$", impact_point-(0,channel_w), align=SE, axes);
label("$w$", impact_point-(0,-channel_w), align=NE, axes);

draw(impact_normal, black+dashed);
draw(incidence_ray, arrow=Arrow(), incidence_col);
draw(reflect_ray, arrow=Arrow(), reflected_col);
draw(refracted_ray, arrow=Arrow(), refracted_col);
draw(refracted_ray2, arrow=Arrow(), refracted_col);

label("$\theta_1$", impact_point, align=2S+4W, incidence_col);
label("$\theta_1$", impact_point, align=2N+4W, reflected_col);
label("$\theta_2$", impact_point, align=1.5N+6E, refracted_col);

label("$e^{i(k_{1}\cos (\theta_1) x+k_{1}\sin (\theta_1) y)}$", incidence_point+(0,1), align=N+0.5W, incidence_col);

label("$R(y) e^{i(-k_{1}\cos (\theta_1) x+k_{1}\sin (\theta_1) y)}$", reflection_point, align=N, reflected_col);

//label(minipage("$$R(y)=1+\sum_{l} R_l \phi_l(y)$$", width=3), impact_point-width/2*(1,0), align=N, reflected_col);

//label(minipage("$$\Psi=\sum_{l} I_l \phi_l(y) e^{i \beta_l x}$$", width=3), impact_point+0.1*(refraction_point-impact_point), align=N, refracted_col);


