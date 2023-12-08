settings.render = 10;
unitsize(x=2cm,y=2cm);

real water_level = 2;

path glass = box((0,0),(2,2.5));
path water = box((0,0),(2,water_level));

draw(glass);
fill(water, blue+opacity(0.3));

draw((0.7,water_level) -- (2.3,water_level), arrow=Arrow);
draw((1,water_level+0.3) -- (1,0.5*water_level), arrow=Arrow);

label("$r$", (2.3,water_level), align=E);
label("$z$", (1,0.5*water_level), align=S);
label("$0$", (1,water_level), align=NW);
dot((1,water_level));

label("$h$", (0,0), align=W);
label("$R$", (2,0), align=S);


