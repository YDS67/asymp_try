texpreamble("\usepackage{mathtext}\usepackage[russian]{babel}");
defaultpen(font("T2A","cmr","m","n"));
defaultpen(fontsize(10pt));

settings.render = 16;
unitsize(5cm);

//graphical parameters
real opaque = 0.3;

path box = (0,0) -- (1,0) -- (1,1) -- (0,1) -- cycle;
real TA = 0.5;
real TB = 0.8;
real TAB = 0.3;
real CAB = 0.3;
real CAb = 0.1;
real CBa = 0.85;

path solidus = (CAb,TAB) -- (CBa,TAB);
path liquidus1 = (0,TA){1,-0.1} .. {1, -1.5}(CAB,TAB) -- (CAb,TAB);
path solidus1 =(0,0) -- (0,TA) .. (CAb,TAB)&(CAb,TAB){-1,-5} .. {-1,-3}(0,0);
path liquidus2 = (CBa,TAB) -- (CAB, TAB){1, 1.5} .. {1, 0.1}(1, TB);
path solidus2 = (1,0){-1,1} .. {-1,5}(CBa, TAB)&(CBa,TAB) .. (1,TB) -- (1,0);

path liquid = (0,TA){1,-0.1} .. {1, -1.5}(CAB,TAB)::(CAB, TAB){1, 1.5} .. {1, 0.1}(1, TB) -- (1,1) -- (0,1) -- cycle;
path solid = (0,0){1,3} .. {1,5}(CAb, TAB) :: solidus :: (CBa, TAB){1,-5} .. {1,-1}(1,0) -- cycle;

label("Частичная растворимость", (0.5, 1), align=N);

draw(box);

fill(liquid, blue+opacity(opaque));
fill(solid, red+opacity(opaque));
fill(solidus1 -- cycle, yellow+opacity(opaque));
fill(solidus2 -- cycle, yellow+opacity(opaque));
fill(liquidus1 -- cycle, purple+opacity(opaque));
fill(liquidus2 -- cycle, purple+opacity(opaque));
label("$A$", (0,0), align=SW);
label("$B$", (1,0), align=SE);
label("$T_A$", (0,TA), align=W);
label("$T_B$", (1,TB), align=E);
dot((0,TA));
dot((1,TB));
dot((CAB, TAB));
dot((CAb, TAB));
dot((CBa, TAB));
draw(solidus);
draw(liquidus1);
draw(liquidus2);
draw(solidus1);
draw(solidus2);

label("Liquid", (0.45, 1 * TB));
label("Solid $\alpha+\beta$", (0.5, 0.5 * TAB));
label("L+$\alpha$", (CAb+0.3*(CAB-CAb), TAB+0.3*(TA-TAB)), fontsize(6));
label("L+$\beta$", (0.55*(1+CAB), 0.4*(TB+TAB)));
label("$ \alpha $", (CAb, TAB), align=2*W);
label("$ \beta $", (CBa, TAB), align=3*E);
