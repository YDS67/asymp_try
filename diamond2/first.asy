settings.render = 16;
settings.prc = false;
//settings.keep = false;
unitsize(10cm);

import three;
import animation;

pen color1 = rgb(0.5, 0.3, 1);
pen color2 = rgb(1, 0, 0.8);
pen color3 = rgb(0.8, 1, 0);
pen color4 = rgb(0.2, 0.4, 0.7);
pen color5 = rgb(0.8, 0.8, 0.9);

path3 bg = (sqrt(3),0,0)--(0.33*sqrt(3),0.67*sqrt(3),0)--(0,0.67*sqrt(3),0.33*sqrt(3))--(0,0,sqrt(3))--cycle;

triple dshift = (1,1,1)/sqrt(3);
real dscale = 0.12;

triple []pos = {
    (0,0,0),
    (0,0,1), //connected to 17
    (0,1,0), //connected to 16
    (1,0,0), //connected to 15
    (0,1,1),
    (1,0,1),
    (1,1,0),
    (1,1,1), //connected to 14
    (0.5, 0.5, 0),
    (0, 0.5, 0.5),
    (0.5, 0, 0.5),
    (0.5, 0.5, 1),
    (1, 0.5, 0.5),
    (0.5, 1, 0.5),
    (0.75, 0.75, 0.75), // connected to 11, 12, 13
    (0.75, 0.25, 0.25), // connected to 12, 8, 10
    (0.25, 0.75, 0.25), // connected to 13, 9, 8
    (0.25, 0.25, 0.75), // connected to 11, 9, 10
};

for(int j=0; j<18; ++j) {
    pos[j] = pos[j]-dshift;
};

int [][]edges = array(18, array(18, 0));
//covalent bonds
edges[14][7] = 1;
edges[14][11] = 1;
edges[14][12] = 1;
edges[14][13] = 1;
edges[15][3] = 1;
edges[15][8] = 1;
edges[15][10] = 1;
edges[15][12] = 1;
edges[16][2] = 1;
edges[16][8] = 1;
edges[16][9] = 1;
edges[16][13] = 1;
edges[17][1] = 1;
edges[17][9] = 1;
edges[17][10] = 1;
edges[17][11] = 1;
//cube mesh
edges[1][0]= 2;
edges[2][0]= 2;
edges[3][0]= 2;
edges[4][1]= 2;
edges[4][2]= 2;
edges[5][1]= 2;
edges[5][3]= 2;
edges[6][2]= 2;
edges[6][3]= 2;
edges[7][4]= 2;
edges[7][5]= 2;
edges[7][6]= 2;

currentprojection=orthographic((-1, -1, -1),up=Y);
currentlight=light((1, 0.5, 1));
currentlight.background=color5;

animation A;

int n=10;
for(int i=0; i < n; ++i) {
real a = 360/n;
for(int j=0; j<18; ++j) {
    pos[j] = rotate(a, (-1,0,1)) * rotate(a, (1,-1,0)) * pos[j];
}

save();

draw(scale3(1.1) * bg, color5);
draw(scale3(1.1) * rotate(90, (-1,0,1)) * bg, color5);
draw(scale3(1.1) * rotate(90, (1,0,-1)) * bg, color5);

for(int j=0; j<18; ++j) {
    for(int k=0; k<18; ++k) {
        if(edges[j][k] == 1) {
            draw(pos[j] -- pos[k], color4+linewidth(12));
        };
        if(edges[j][k] == 2) {
            draw(pos[j] -- pos[k], gray+linewidth(7));
        };
    }
}

for(int j=0; j<8; ++j) {
    draw(shift(pos[j])*scale3(dscale)*unitsphere,color1);
}

for(int j=8; j<14; ++j) {
    draw(shift(pos[j])*scale3(dscale)*unitsphere,color2);
}

for(int j=14; j<18; ++j) {
    draw(shift(pos[j])*scale3(dscale)*unitsphere,color3);
}
A.add();
restore();
}

A.movie();
