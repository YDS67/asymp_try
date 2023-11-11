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
P.add_title();
A.add();
restore();

save();
P.add_slide("First slide title");

P.add_text_right("text1.txt");

frame figure1 = fig1(0.25,0.5).fit();
add(figure1);

A.add();
restore();

save();
P.add_slide("Second slide title");

P.add_text_left("formula1.txt");

frame figure2 = fig2(2.2,0.75).fit();
add(figure2);

A.add();
restore();

save();
P.add_slide("Third slide title");

P.add_text_right("formula1.txt");

P.add_text_left("text1.txt");

A.add();
restore();

P.title = "Thank you!";
P.author = "111@111.com";
P.affiliation = " ";
P.date = " ";

save();
P.add_title();
A.add();
restore();

A.movie();
