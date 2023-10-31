texpreamble("\usepackage{mathtext}\usepackage[russian]{babel}");
defaultpen(font("T2A","cmr","m","n"));
defaultpen(fontsize(10pt));

//settings.outformat = "pdf";
settings.render = 16;
unitsize(5cm);

path box = (0,0) -- (1,0) -- (1,1) -- (0,1) -- cycle;
real TA = 0.3;
real TB = 0.7;
path liquidus = (0,TA){1, 0} .. (1,TB);
path solidus =  (1,TB){-1,0} .. (0,TA);
path liquid = liquidus -- (1,1) -- (0,1) -- (0,TA) -- cycle;
path solid = solidus -- (0,0) -- (1,0) -- (1,TB) -- cycle;

label("Непрерывный ряд твёрдых растворов", (0.5, 1), align=N, heavyblue);

draw(box);
label("$A$", (0,0), align=SW);
label("$B$", (1,0), align=SE);
label("$T_A$", (0,TA), align=W);
label("$T_B$", (1,TB), align=E);
dot((0,TA));
dot((1,TB));
//draw((0,TA) -- (1,TB), blue+dashed);
draw(liquidus :: solidus);
fill(liquidus :: solidus -- cycle, green+opacity(.07));
fill(liquid, blue+opacity(.07));
fill(solid, yellow+opacity(.07));
dot((0.4,0.5 * (TA+TB)), red);

draw((0, 0.5 * (TA+TB)) -- (1, 0.5 * (TA+TB)), red+dashed);
label("Жидкое", (0.5, 1.2 * TB));
label("Твердое", (0.5, 0.8 * TA));
label("Ж+Тв", (0.7, 0.83 * TB));