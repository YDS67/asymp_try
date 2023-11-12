import setup;
import logo;
import figures;

// Initial settings
preamble();
presentation P;

// General information
P.title = "Presentation title";
P.author = "Author's name";
P.affiliation = "Awesome university";
P.date = "November 2023";

// Main title slide
P.add_title();

P.add_slide("First slide title");

P.add_text_right("text1.txt");

frame figure1 = align(fig1().fit(),(1.25cm,1.5cm));
add(figure1);

P.add_slide("Second slide title");

P.add_text_left("formula1.txt");

frame figure2 = align(fig2().fit(),(8.5cm,4cm));
add(figure2);

P.add_slide("Third slide title");

P.add_text_left("text2.txt");

draw(graphic("wavepacket.png", "width=6cm"), (9,7.5), align=SE);

P.add_slide("Fourth slide title");

frame figure3 = align(fig3().fit(),(1.1cm,1.2cm));
add(figure3);

P.add_text_sright("text3.txt");

P.add_slide("Fifth slide title");

P.add_text_left("text2.txt");

draw(graphic("spectrum.pdf", "width=6cm"), (9,7.5), align=SE);


// Final slide
P.title = "Thank you!";
P.author = "111@111.com";
P.affiliation = " ";
P.date = " ";

newpage();
P.add_title();

