picture fig1(real x, real y, real s=1) 
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
