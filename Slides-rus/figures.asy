picture fig1(real x=0, real y=0, real s=1) 
{
    picture pic1;

    unitsize(pic1, 5cm);

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

    draw(pic1, box);

    fill(pic1, liquid, blue+opacity(opaque));
    fill(pic1, solid, red+opacity(opaque));
    fill(pic1, solidus1 -- cycle, yellow+opacity(opaque));
    fill(pic1, solidus2 -- cycle, yellow+opacity(opaque));
    fill(pic1, liquidus1 -- cycle, purple+opacity(opaque));
    fill(pic1, liquidus2 -- cycle, purple+opacity(opaque));
    label(pic1, "$A$", (0,0), align=SW);
    label(pic1, "$B$", (1,0), align=SE);
    label(pic1, "$T_A$", (0,TA), align=W);
    label(pic1, "$T_B$", (1,TB), align=E);
    dot(pic1, (0,TA));
    dot(pic1, (1,TB));
    dot(pic1, (CAB, TAB));
    dot(pic1, (CAb, TAB));
    dot(pic1, (CBa, TAB));
    draw(pic1, solidus);
    draw(pic1, liquidus1);
    draw(pic1, liquidus2);
    draw(pic1, solidus1);
    draw(pic1, solidus2);

    label(pic1, "Liquid", (0.45, 1 * TB));
    label(pic1, "Solid $\alpha+\beta$", (0.5, 0.5 * TAB));
    label(pic1, "L+$\alpha$", (CAb+0.3*(CAB-CAb), TAB+0.3*(TA-TAB)), fontsize(6));
    label(pic1, "L+$\beta$", (0.55*(1+CAB), 0.4*(TB+TAB)));
    label(pic1, "$ \alpha $", (CAb, TAB), align=2*W);
    label(pic1, "$ \beta $", (CBa, TAB), align=3*E);
    
    return shift(x,y)*scale(s)*pic1;
};

picture fig2(real x=0, real y=0, real s=1) {
    picture pic;

    defaultpen(fontsize(10pt));
    unitsize(pic, 4cm);

    real phi = (sqrt(5)+1)/2;

    real g = 9.81;
    real vx_0 = 1.9;
    real vy_0 = 3.8;
    real v0 = sqrt(vx_0^2 + vy_0^2);
    real t_f = 2 * vy_0 / g;
    real x_f = vx_0 * t_f;
    real y_max = vy_0^2 / 2 / g;
    real t_mid = vy_0 / g;
    real y_mid = vy_0 * t_mid - g * t_mid^2 / 2;
    real x_mid = vx_0 * t_mid;
    real vy_f = vy_0 - g * t_f;

    draw(pic, (-.1,0) -- (phi,0), arrow = Arrow);
    draw(pic, (0,-.1) -- (0,1), arrow = Arrow);
    label(pic, "$x$", (phi,0), align=E);
    label(pic, "$y$", (0,1), align=N);

    draw(pic, (phi,1) * .9 -- (phi, .7) * .9, arrow = Arrow(SimpleHead), linewidth(.7));
    label(pic, "$\vec{g}$", (phi, 1) * .9, align=N);

    draw(pic, (0,0){vx_0, vy_0} .. (x_mid, y_max) .. {vx_0,vy_f}(x_f,0), blue);
    fill(pic, (0,0){vx_0, vy_0} .. (x_mid, y_max) .. {vx_0,vy_f}(x_f,0) -- cycle, blue+opacity(.07));

    draw(pic, (0,0) -- .15 * (vx_0, vy_0), arrow = Arrow(SimpleHead), red);
    label(pic, "$\vec{v}_0$", .15 * (vx_0, vy_0), align=NW, red);

    dot(pic, (x_mid, y_mid), purple);
    label(pic, "$y_{max} - ?$", (x_mid, y_mid), align=N, purple);

    return shift(x,y)*scale(s)*pic;
};