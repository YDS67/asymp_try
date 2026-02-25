//texpreamble("\usepackage{mathtext}\usepackage[russian]{babel}");
//defaultpen(font("T2A","cmr","m","n"));
defaultpen(fontsize(25pt));

settings.render = 8;
unitsize(1cm);

pair cen(path p){
    return 0.5*(min(p) + max(p));
};

//graphical parameters
pen p = black+linewidth(2);

path main = box((-21,-1),(21,11));
path resistor = (0,0) -- (0.5,1) -- (1.5,-1) -- (2.5,1) -- (3.5,-1) -- (4.5,1) -- (5.5,-1) -- (6,0);
path resistor_box = box(min(resistor), max(resistor));
path inductor = arc((1,0), 1, 180, 0, false) -- arc((3,0), 1, 180, 0, false) -- arc((5,0), 1, 180, 0, false) -- arc((7,0), 1, 180, 0, false);
path inductor_box = box(min(inductor)-(0,1), max(inductor));
path[] capacitor = (0,-1.5) -- (0,1.5) ^^ (1.5,-1.5) -- (1.5,1.5);
path capacitor_box = box(min(capacitor),max(capacitor));

void draw_resistor(pair pos, real scale, bool rot, string text){
    path box1 = scale(scale)*resistor_box;
    pair center = cen(box1);
    transform transf = shift(pos-center)*scale(scale);
    align al;
    if(rot) {
        transf = transf*rotate(-90,cen(resistor_box));
        al = 2*W;
    }
    else {
        al = 2*S;
    };
    fill(transf*resistor_box, white);
    draw(transf*resistor, p);
    label(text, transf*resistor, p, align = al);
};

void draw_inductor(pair pos, real scale, bool rot, string text){
    path box1 = scale(scale)*inductor_box;
    pair center = cen(box1);
    transform transf = shift(pos-center)*scale(scale);
    align al;
    if(rot) {
        transf = transf*rotate(-90,cen(inductor_box));
        al = 2*W;
    }
    else {
        al = 2*S;
    };
    fill(transf*inductor_box, white);
    draw(transf*inductor, p);
    label(text, transf*inductor, p, align = al);
};

void draw_capacitor(pair pos, real scale, bool rot, string text){
    path box1 = scale(scale)*capacitor_box;
    pair center = cen(box1);
    transform transf = shift(pos-center)*scale(scale);
    align al;
    if(rot) {
        transf = transf*rotate(-90,cen(capacitor_box));
        al = 1.5W+2*N;
    }
    else {
        al = 2*N;
    };
    fill(transf*capacitor_box, white);
    draw(transf*capacitor, p);
    label(text, cen(transf*capacitor_box), p, align = al);
};

fill(main, white);

path[] circuit = (0,8) -- (20,8) ^^ (0,1) -- (20,1) ^^ (12,8) -- (12,1) ^^ (16.5,8) -- (16.5,1);

draw(circuit,p);
draw_resistor((3,8), 0.5, false, "$R(z)$");
draw_inductor((8,8), 0.5, false, "$L(z)$");
draw_resistor((12,4.5), 0.5, true, "$G(z)$");
draw_capacitor((16.5,4.5), 0.5, true, "$C(z)$");
draw("$\Delta z$", (0,-0.2) -- (20,-0.2), p, arrow=Arrows(arrowhead=TeXHead), align=N);

draw(shift((-20,0))*circuit,p);
draw_resistor((3,8)+(-20,0), 0.5, false, "$R(z-\Delta z)$");
draw_inductor((8,8)+(-20,0), 0.5, false, "$L(z-\Delta z)$");
draw_resistor((12,4.5)+(-20,0), 0.5, true, "$G(z-\Delta z)$");
draw_capacitor((16.5,4.5)+(-20,0), 0.5, true, "$C(z-\Delta z)$");

fill(circle((-20,1),0.2), p);
fill(circle((-20,8),0.2), p);
fill(circle((0,1),0.2), p);
fill(circle((0,8),0.2), p);
fill(circle((20,1),0.2), p);
fill(circle((20,8),0.2), p);
label("$+$", (-20,8), align=S);
label("$+$", (0,8), align=S);
label("$+$", (20,8), align=S);
label("$-$", (-20,1), align=N);
label("$-$", (0,1), align=N);
label("$-$", (20,1), align=N);
label("$V(z-\Delta z)$", (0,4.5));
label("$V(z)$", (20,4.5));
draw("$I(z-\Delta z)$", (-5,9) -- (0,9), p, arrow=Arrow(arrowhead=HookHead, size=15), align=N);
draw("$I(z)$", (15,9) -- (20,9), p, arrow=Arrow(arrowhead=HookHead, size=15), align=N);

draw(arc((5,4), 2, 359, 20, false), red+linewidth(2), 
    arrow=Arrow(arrowhead=HookHead, size=15));
fill(circle((14,8),0.3), red);
label("$I$", (14,8), red, align=2N);
label("$II$", (5,4), red);