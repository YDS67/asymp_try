//texpreamble("\usepackage{mathtext}\usepackage[russian]{babel}");
//defaultpen(font("T2A","cmr","m","n"));
defaultpen(fontsize(14pt)+linewidth(1));
// Change arrow size
DefaultHead.size=new real(pen p=currentpen) {return 10;};
SimpleHead.size=new real(pen p=currentpen) {return 10;};

settings.render = 16;
unitsize(1cm);

pen small_dash = linetype(new real[] {4,6});

//graphical parameters
pen c_yellow = rgb("#faedcb");
pen c_green = rgb("#c9e4de");
pen c_blue = rgb("#c6def1");
pen c_purple = rgb("#dbcdf0");
pen c_red = rgb("#f2c6de");
pen c_orange = rgb("#f7d9c4");
pen c_gray = rgb("#888888");


real half_width = 5;
real half_height = 4;
real ellipse_a = 3.5;
real ellipse_b = 2.5;
real speed = 2;
real angle_theta = pi/3;
real impact_parameter_max_squared = ellipse_a^2*sin(angle_theta)^2+ellipse_b^2*cos(angle_theta)^2;
real impact_parameter_max = sqrt(impact_parameter_max_squared);
real impact_parameter_beta = 0.75*impact_parameter_max;
real impact_x = (-ellipse_a^2*impact_parameter_beta*sin(angle_theta)-ellipse_a*ellipse_b*cos(angle_theta)*sqrt(impact_parameter_max_squared-impact_parameter_beta^2))/impact_parameter_max_squared;
real impact_y = (ellipse_b^2*impact_parameter_beta*cos(angle_theta)-ellipse_a*ellipse_b*sin(angle_theta)*sqrt(impact_parameter_max_squared-impact_parameter_beta^2))/impact_parameter_max_squared;

pair impact = (impact_x,impact_y);
pair normal_unscaled = (impact_x/ellipse_a^2,impact_y/ellipse_b^2);
pair normal_unit = normal_unscaled/abs(normal_unscaled)*1.5;
pair velocity_start = impact - speed*(cos(angle_theta),sin(angle_theta));
pair normal_end = impact - normal_unit;

path background = box(-(half_width,half_height),(half_width,half_height));
path ellipse_ = ellipse((0,0),ellipse_a,ellipse_b);
path velocity_m = velocity_start -- impact;
path velocity_line = impact -- impact + speed*(cos(angle_theta),sin(angle_theta))*2;
path vec_to_center = impact -- (0,0);
path line_to_center = impact -- (0,0) - impact;
path normal = impact -- normal_end;
path normal_line = impact -- impact - normal_unit*3;

fill(background,white);

fill(ellipse_,c_blue);
draw(ellipse_);
label("$a$", (ellipse_a,0), align=N+W);
label("$b$", (0,ellipse_b), align=S+E);

draw(velocity_m, arrow=Arrow(SimpleHead), blue);
label("$\vec{v}$", velocity_start, align=N+2E, blue);
draw(velocity_line, small_dash+blue);
draw(normal, arrow=Arrow(SimpleHead), red);
label("$\vec{n}$", impact, align=N+W, red);
draw(normal_line, small_dash+red);
draw(vec_to_center, arrow=Arrow(SimpleHead), purple);
draw(line_to_center, small_dash+purple);
label("$\vec{R}$", impact, align=N+2E, purple);

draw((0,-half_height) -- (0,half_height), arrow=Arrow);
draw((-half_width,0) -- (half_width,0), arrow=Arrow);
label("$y$", (0,half_height), align=S+2E);
label("$x$", (half_width,0), align=2N+W);
