texpreamble("\usepackage{mathtext}\usepackage[russian]{babel}");
defaultpen(font("T2A","cmr","m","n"));
defaultpen(fontsize(10pt));

settings.render = 10;
unitsize(2cm);

//graphical parameters
real opaque = 0.3;
real height = 3;

path metal_surface_1 = (1,0) -- (1,height);
path metal_surface_2 = (2,0) -- (2,height);
path qd_surface_1 = (1.1,0) -- (1.1,height);
path qd_surface_2 = (1.9,0) -- (1.9,height);

real eV = height/2.5;
real F2 = height/3;
real F1 = F2 + eV;
real E0 = F2 + height/5;
real kT = height/8;
real gamma = height/10;

path metal_F1 = (0,F1) -- (1,F1);
path metal_F2 = (2,F2) -- (3,F2);
path qd_E0 = (1.1,E0) -- (1.9,E0);

path fermi_1 = (0,0) -- (0,F1-kT){0,1} .. (0.5, F1) .. {0,1}(1, F1+kT) -- (1, 0) -- cycle;
path fermi_2 = (3,0) -- (3,F2-kT){0,1} .. (2.5, F2) .. {0,1}(2, F2+kT) -- (2, 0) -- cycle;
path density_of_states = (1.1, E0-3*gamma){0.1,1} .. (1.5, E0-gamma) .. (1.8, E0-0.5*gamma) .. (1.9, E0) .. (1.8, E0+0.5*gamma) .. (1.5, E0+gamma) .. {-0.1,1}(1.1, E0+3*gamma) -- cycle;

path electrons_1 = metal_F1 -- (1,0) -- (0,0) -- cycle;
path electrons_2 = metal_F2 -- (3,0) -- (2,0) -- cycle;
path gamma_line = (1.5, E0-gamma) -- (1.5, E0+gamma);

label("Протекание тока через квантовую точку", (1.5, height), align=N);

//draw(metal_surface_1);
//draw(metal_surface_2);
draw(density_of_states, darkgreen);
fill(density_of_states, darkgreen+opacity(opaque));
draw(qd_surface_1);
draw(qd_surface_2);
draw(fermi_1, purple);
draw(fermi_2, purple);
fill(fermi_1, purple+opacity(opaque));
fill(fermi_2, purple+opacity(opaque));
//fill(electrons_1, purple+opacity(opaque));
//fill(electrons_2, purple+opacity(opaque));
draw(metal_F1, dashed);
draw(metal_F2, dashed);
draw(qd_E0, dashed);
draw(gamma_line, blue, arrow = Arrows(TeXHead));

label("$E_0$", (1.9, E0), align=E);
label("$F_1$", (0.5, F1), align=N);
label("$F_2$", (2.5, F2), align=N);
label("$D(E)$", (1.5, E0), align=6*N+E);
label("$\gamma$", (1.5, E0), align=6*S+E);