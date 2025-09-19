unitsize(8cm);
defaultpen(fontsize(14pt));

draw((-0.25,0) -- (0.7,0), arrow = Arrow);
draw((0,-0.25) -- (0,0.7), arrow = Arrow);
label("$x$", (0.7,0), align=E);
label("$y$", (0,0.7), align=N);


pair origin = (0,0);
real radius1 = 0.75;
real radius2 = 0.7;
real angle1 = pi/6;
real angle2 = pi/3;
pair theta1 = 0.2*(cos(angle1/2),sin(angle1/2));
pair theta2 = 0.1*(cos(angle2/2),sin(angle2/2));
pair theta12 = 0.25*(cos(angle2*2/3),sin(angle2*2/3));
pair r1 = radius1*(cos(angle1),sin(angle1));
pair r2 = radius2*(cos(angle2),sin(angle2));


draw(origin -- r1, arrow = Arrow(SimpleHead));
label("$\vec{r}_1$", r1, align=NE);
draw(origin -- r2, arrow = Arrow(SimpleHead));
label("$\vec{r}_2$", r2, align=N);

draw(arc(origin, 0.2, degrees(angle1), 0));
draw(arc(origin, 0.1, degrees(angle2), 0), dashed);
draw(arc(origin, 0.25, degrees(angle2), degrees(angle1)), dashdotted);

label("$\theta_1$", theta1, align=E);
label("$\theta_2$", theta2, align=2.2N+E);
label("$\theta_{12}$", theta12, align=NE);

draw(r1 -- r2);
draw(r1 -- (r1.x,0));
draw(r2 -- (r2.x,0));