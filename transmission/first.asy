//texpreamble("\usepackage{mathtext}\usepackage[russian]{babel}");
//defaultpen(font("T2A","cmr","m","n"));
defaultpen(fontsize(25pt));

settings.render = 16;
unitsize(1cm);

//graphical parameters
pen p = black+linewidth(2);

path main = box((0,0),(20,11));
path resistor = (0,0) -- (0.5,1) -- (1.5,-1) -- (2.5,1) -- (3.5,-1) -- (4.5,1) -- (5.5,-1) -- (6,0);
path resistor_box = box(min(resistor), max(resistor));
path inductor = arc((1,0), 1, 180, 0, false) -- arc((3,0), 1, 180, 0, false) -- arc((5,0), 1, 180, 0, false) -- arc((7,0), 1, 180, 0, false);
path inductor_box = box(min(inductor)-(0,1), max(inductor));
path[] capacitor = (0,-1.5) -- (0,1.5) ^^ (1.5,-1.5) -- (1.5,1.5);
path capacitor_box = box(min(capacitor),max(capacitor));

void draw_resistor(pair pos, real scale, bool rot, string text){
    transform transf = shift(pos)*scale(scale);
    align al;
    if(rot) {
        transf = transf*rotate(-90,(0,0));
        al = 2*W;
    }
    else {
        al = 2*N;
    };
    fill(transf*resistor_box, white);
    draw(transf*resistor, p);
    label(text, transf*resistor, p, align = al);
};

void draw_inductor(pair pos, real scale, bool rot, string text){
    transform transf = shift(pos)*scale(scale);
    align al;
    if(rot) {
        transf = transf*rotate(-90,(0,0));
        al = 2*W;
    }
    else {
        al = 2*N;
    };
    fill(transf*inductor_box, white);
    draw(transf*inductor, p);
    label(text, transf*inductor, p, align = al);
};

void draw_capacitor(pair pos, real scale, bool rot, string text){
    transform transf = shift(pos)*scale(scale);
    align al;
    if(rot) {
        transf = transf*rotate(-90,(0,0));
        al = 2*W+2*N;
    }
    else {
        al = 2*N;
    };
    fill(transf*capacitor_box, white);
    draw(transf*capacitor, p);
    label(text, (midpoint(transf*capacitor[0])+midpoint(transf*capacitor[1]))/2, p, align = al);
};

fill(main, white);

path[] circuit = (0,8) -- (20,8) ^^ (0,1) -- (20,1) ^^ (12,8) -- (12,1) ^^ (16,8) -- (16,1);

draw(circuit,p);
draw_resistor((2,8), 0.5, false, "$R(z) \Delta l$");
draw_inductor((6,8), 0.5, false, "$L(z) \Delta l$");
draw_resistor((12,6), 0.5, true, "$G(z) \Delta l$");
draw_capacitor((16,5), 0.5, true, "$C(z) \Delta l$");
draw("$\Delta l$", (0,10) -- (20,10), p, arrow=Arrows(arrowhead=TeXHead), align=N);

// draw(device,p);
// draw(line1,p);
// draw(line2,p);
// draw(line3,p);
// draw(line4,p);

// fill(circle((0,0.9),0.04),black);
// fill(circle((0,0.1),0.04),black);
// fill(circle((3,0.9),0.04),black);
// fill(circle((3,0.1),0.04),black);

// draw("$U_1$", u1, p, arrow = Arrow, align=W);
// draw("$U_2$", u2, p, arrow = Arrow, align=E);
// draw("$I_1$", i1, p, arrow = Arrow, align=S);
// draw("$I_1^{\prime}$", i11, p, arrow = Arrow, align=N);
// draw("$I_2$", i2, p, arrow = Arrow, align=S);
// draw("$I_2^{\prime}$", i21, p, arrow = Arrow, align=N);