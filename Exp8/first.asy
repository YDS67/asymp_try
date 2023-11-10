import graph;
defaultpen(fontsize(7)+TimesRoman());
settings.render = 12;
size(12cm, 7cm, IgnoreAspect);

real gamcor(real x, real g) {
    return (x/255)^g * 255;
}
real[] x = sequence(256);
real[] g = {0.04,0.1,0.2,0.4,0.67,1,1.5,2.5,5,10,25};
real xl = 25;

for(int i=0; i < 11; ++i) {
    pen p = linewidth(0.5)+cmyk(sin(i)^2,1-i/11,cos(i)^2,0.1);
    real gamcorG(real x) {
    return gamcor(x,g[i]);
    }
    real[] y = map(gamcorG, x);
    pair p1 = (xl-5,gamcorG(xl-5));
    pair p2 = (xl+5,gamcorG(xl+5));
    draw(graph(x, y), p);
    ylimits(0,255);
    label(Label("$\gamma = " + string(g[i]) + "$",Rotate(p2-p1)),(xl,gamcorG(xl)), p, Fill(white));
    xl = xl+21;
};

label(Label("\textbf{Gamma correction for different values of} $\gamma$"), (256/2, 258), align=N, black);
xaxis("Input value",BottomTop,LeftTicks(Courier("m","n")+fontsize(4),Step=50,Size=1));
yaxis("Output value",LeftRight,RightTicks(Courier("m","n")+fontsize(4),Step=50,Size=1));

shipout(bbox(0.25cm,white,Fill));

