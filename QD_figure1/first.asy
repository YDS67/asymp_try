texpreamble("\usepackage{mathtext}\usepackage[russian]{babel}");
defaultpen(font("T2A","cmr","m","n"));
defaultpen(fontsize(10pt));

settings.render = 10;
unitsize(x=3cm,y=3cm);

//graphical parameters
real opaque = 0.3;
real height = 2; // eV

int n_points_y = 200;
real dy = height/n_points_y;

path metal_surface_1 = (1,0) -- (1,height);
path metal_surface_2 = (2,0) -- (2,height);
path qd_surface_1 = (1.1,0) -- (1.1,height);
path qd_surface_2 = (1.9,0) -- (1.9,height);

real eV = height/2.5;
real F2 = height/3;
real F1 = F2 + eV;
real E0 = F2 + height/5;
real kT = height/30;
real gamma = height/20;

real fermi(real f, real e) {
    return 1/(exp((e-f)/kT)+1);
}

real dens_states(real e) {
    return 0.8 * gamma*gamma/((e-E0)*(e-E0)+gamma*gamma);
}

path fermi_1 = (1, 0) -- (0,0);

for(int i=1; i < n_points_y; ++i) {
    fermi_1 = fermi_1 -- (1 - fermi(F1, dy*i), dy*i);
};

path fermi_2 = (2,0) -- (3,0);

for(int i=1; i < n_points_y; ++i) {
    fermi_2 = fermi_2 -- (2 + fermi(F2, dy*i), dy*i);
};

path DE_path = (1.1, height) -- (1.1,0);

for(int i=1; i < n_points_y; ++i) {
    DE_path = DE_path -- (1.1 + dens_states(dy*i), dy*i);
};

path metal_F1 = (0,F1) -- (1,F1);
path metal_F2 = (2,F2) -- (3,F2);
path qd_E0 = (1.1,E0) -- (1.9,E0);

path gamma_line = (1.5, E0-gamma) -- (1.5, E0+gamma);

label("Протекание тока через квантовую точку", (1.5, height), align=N);

draw(fermi_1, purple);
draw(fermi_2, purple);
fill(fermi_1 -- cycle, purple+opacity(opaque));
fill(fermi_2 -- cycle, purple+opacity(opaque));

draw(metal_surface_1);
draw(metal_surface_2);
draw(DE_path, darkgreen);
fill(DE_path -- cycle, darkgreen+opacity(opaque));
draw(qd_surface_1);
draw(qd_surface_2);

//fill(electrons_1, purple+opacity(opaque));
//fill(electrons_2, purple+opacity(opaque)); 
draw(metal_F1, dashed);
draw(metal_F2, dashed);
draw(qd_E0, dashed);
draw(gamma_line, blue, arrow = Arrows(TeXHead));

label("$E_0$", (1.9, E0), align=2*N+W);
label("$F_1$", (0.5, F1), align=N);
label("$F_2$", (2.5, F2), align=N);
label("$D(E)$", (1.5, E0), align=7*N+E);
label("$\gamma = " + string(gamma,1) + "$", (1.5, E0), align=8*S+E);

label("$f_1(E_0) = " + string(fermi(F1,E0), 3) + "$", (0.5, 0), align=2*S);
label("$f_2(E_0) = " + string(fermi(F2,E0), 3) + "$", (2.5, 0), align=2*S);
label("$kT = " + string(kT, 3) + "$", (1.5, 0), align=S);
