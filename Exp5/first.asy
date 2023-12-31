texpreamble("\usepackage{mathtext}\usepackage[russian]{babel}");
defaultpen(font("T2A","cmr","m","n"));
defaultpen(fontsize(10pt));

settings.render = 16;
unitsize(5cm);

//graphical parameters
real opaque = 0.3;

path box = (0,0) -- (1,0) -- (1,1) -- (0,1) -- cycle;
real TA = 0.3;
real TB = 0.7;
real T0 = 0.5 * (TA+TB);
real C0 = 0.4;
path solidus = (0,TA){1, 0} .. (1,TB);
path liquidus =  (1,TB){-1,0} .. (0,TA);
path liquid = liquidus -- (0,1) -- (1,1) -- (1,TB) -- cycle;
path solid = solidus -- (1,0) -- (0,0) -- (0,TA) -- cycle;
path isotherm = (0, T0) -- (1, T0);
pair TC0 = (C0, T0);
pair TCliq = intersectionpoints(isotherm, liquidus)[0];
pair TCsol = intersectionpoints(isotherm, solidus)[0];
path define = TCliq -- TCsol;


label("Непрерывный ряд твёрдых растворов", (0.5, 1), align=N);

draw(box);
fill(liquidus :: solidus -- cycle, purple+opacity(opaque));
fill(liquid, blue+opacity(opaque));
fill(solid, red+opacity(opaque));
label("$A$", (0,0), align=SW);
label("$B$", (1,0), align=SE);
label("$T_A$", (0,TA), align=W);
label("$T_B$", (1,TB), align=E);
dot((0,TA));
dot((1,TB));
//draw((0,TA) -- (1,TB), blue+dashed);
draw(liquidus :: solidus);
draw(define, purple+dashed);
draw(define, purple+dashed);
draw(TCliq -- (TCliq.x, 0), blue+dashed);
draw(TCsol -- (TCsol.x, 0), red+dashed);
draw((0, TCliq.y) -- TCliq, dotted);
draw(TC0 -- (TC0.x, 0), dotted);
dot(TC0, purple);
label("O", TC0, align=1.5*NE);
dot(TCliq, blue);
dot(TCsol, red);

label("Liquid", (0.45, 1.2 * TB));
label("Solid", (0.55, 0.8 * TA));
label("L+S", (0.7, 0.83 * TB));

label("$C_L$", (TCliq.x, 0), align=S);
label("$C_S$", (TCsol.x, 0), align=S);
label("$C_0$", (TC0.x, 0), align=S);
label("$T_0$", (0, TCliq.y), align=W);

label("$C = \frac{m_B}{m_A+m_B}, \quad $ $\frac{m_L}{m_S}$ в точке O --- ?", (0.5, 0), align=7*S, Fill(xmargin=3, ymargin=3, lightgray));