import animation;
import setup;
import logo;
import figures;

preamble();

presentation P;

P.title = "Presentation title";
P.author = "Author's name";
P.affiliation = "Awesome university";
P.date = "November 2023";

animation A;

save();
P.title_init();
A.add();
restore();

save();
P.slide_init("First slide title");

file text1 = input("text1.txt");
string txt = text1;
label(minipage(txt ,7cm),(8,7.5), align=SE);

frame figure1 = fig1(0.25,0.5).fit();
add(figure1);

A.add();
restore();

save();
P.slide_init("Second slide title");

file formula1 = input("formula1.txt");
string txt = formula1;
label(minipage(txt ,7cm),(1,7.5), align=SE);

frame figure1 = fig1(2,0.5).fit();
add(figure1);

A.add();
restore();

P.title = "Thank you!";
P.author = "111@111.com";
P.affiliation = " ";
P.date = " ";

save();
P.title_init();
A.add();
restore();

A.movie();
